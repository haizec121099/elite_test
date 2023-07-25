<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use App\Models\Crew;
use App\Models\Document;

class DocumentController extends Controller
{
    

    public function getAll($crewId): JsonResponse
    {
        return response()->json([
            "data" => Crew::findOrFail($crewId)->documents
        ]);
    }

    public function get($crewId, $documentId): JsonResponse
    {
        return response()->json([
            "data" => Document::where("crew_id", $crewId)
                ->where("id", $documentId)
                ->firstOrFail()
        ]);
    }

    public function store(Request $request, $crewId): JsonResponse
    {
        $validated = $request->validate([
            "code" => "required|alpha_num:ascii|max:255",
            "name" => "required|string|max:255",
            "document_number" => "required|string|max:255",
            "date_issued" => "required|date",
            "date_expiry" => "required|date",
            "remarks" => "string|max:255"
        ]);

        $validated["crew_id"] = $crewId;

        Document::create($validated);

        return response()
            ->json([
                "message" => "Successfully created document!"
            ]);
    }

    public function update(Request $request, $crewId, $documentId): JsonResponse
    {
        $document = Document::where("crew_id", $crewId)
            ->where("id", $documentId)
            ->firstOrFail();

        $validated = $request->validate([
            "code" => "required|alpha_num:ascii|max:255",
            "name" => "required|string|max:255",
            "document_number" => "required|string|max:255",
            "date_issued" => "required|date",
            "date_expiry" => "required|date",
            "remarks" => "string|max:255"
        ]);

        $document->code= $validated["code"];
        $document->name = $validated["name"];
        $document->document_number = $validated["document_number"];
        $document->date_issued = $validated["date_issued"];
        $document->date_expiry = $validated["date_expiry"];
        $document->remarks = $validated["remarks"];

        if (!$document->save())
        {
            return repsonse()
                ->json([
                    "message" => "Failed to update document record!"
                ]);
        }

        return response()
            ->json([
                "message" => "Successfully updated document record!"
            ]);
    }

    public function delete(Request $request, $crewId, $documentId): JsonResponse
    {
        if (!Document::where("crew_id", $crewId)
            ->where("id", $documentId)
            ->firstOrFail()
            ->delete())
        {
            return response()
                ->json([
                    "message" => "Failed to delete document record!"
                ]);
        }


        return response()
            ->json([
                "message" => "Successfully deleted document record!"
            ]);
    }
}
