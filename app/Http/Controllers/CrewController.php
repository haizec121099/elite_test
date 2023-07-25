<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Http\Requests\Auth\LoginRequest;
use App\Providers\RouteServiceProvider;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;
use App\Models\Crew;

class CrewController extends Controller
{
    
    public function create()
    {
        return Inertia::render("Crew/CrewForm", [
            "crew" => (object)[],
            "buttonName" => "Create Crew",
            "postUrl" => true
        ]);
    }

    public function view()
    {
        $crews = Crew::all();

        $crews = $crews->map(function($crew) {
            return (object)[
                "id" => $crew->id,
                "first_name" => $crew->first_name,
                "last_name" => $crew->last_name,
                "middle_name" => $crew->middle_name,
                "email" => $crew->email
            ];
        });

        return Inertia::render("Dashboard", [
            "crews" => $crews
        ]);
    }

    public function viewCrew($id)
    {
        $crew = Crew::findOrFail($id);

        return Inertia::render("Crew/CrewDocumentForm", [
            "crew" => $crew,
            "documents" => $crew->documents
        ]);
    }

    public function editCrew($id)
    {
        $crew = Crew::findOrFail($id);

        return Inertia::render("Crew/CrewForm", [
            "crew" => $crew,
            "buttonName" => "Update Crew",
            "putUrl" => true
        ]);
    }

    public function update(Request $request, $id)
    {
        $validated = $request->validate([
            "first_name" => "required|max:100",
            "last_name" => "required|max:100",
            "middle_name" => "max:100",
            "email" => "required|email|unique:crews,email,{$id}|max:150",
            "house_no" => "max:50",
            "education" => "required|max:255",
            "street" => "required|max:50",
            "barangay" => "required|max:50",
            "city_municipality" => "required|max:50",
            "province" => "required|max:50",
            "zip_code" => "required|digits:4|numeric",
            "mobile_no" => "required|max:13|unique:crews,mobile_no,{$id}"
        ]);

        $crew = Crew::findOrFail($id);

        $crew->first_name = $validated["first_name"];
        $crew->last_name = $validated["last_name"];
        $crew->middle_name = $validated["middle_name"];
        $crew->email = $validated["email"];
        $crew->house_no = $validated["house_no"];
        $crew->education = $validated["education"];
        $crew->street = $validated["street"];
        $crew->barangay = $validated["barangay"];
        $crew->city_municipality = $validated["city_municipality"];
        $crew->province = $validated["province"];
        $crew->zip_code = $validated["zip_code"];
        $crew->mobile_no = $validated["mobile_no"];

        if (!$crew->save())
        {
            return response()
                ->json([
                    "message" => "Failed to update crew record!"
                ]);
        }

        return response()
            ->json([
                "message" => "Successfully updated crew record!"
            ]);
    }

    public function delete($id)
    {
        if (!Crew::findOrFail($id)->delete())
        {
            return response()
                ->json([
                    "message" => "Failed to delete crew record!"
                ]);
        }

        return response()
            ->json([
                "message" => "Successfully deleted crew record!"
            ]);
    }

    public function store(Request $request): JsonResponse
    {
        $validated = $request->validate([
            "first_name" => "required|max:100",
            "last_name" => "required|max:100",
            "middle_name" => "max:100",
            "email" => "required|email|unique:crews|max:150",
            "house_no" => "max:50",
            "education" => "required|max:255",
            "street" => "required|max:50",
            "barangay" => "required|max:50",
            "city_municipality" => "required|max:50",
            "province" => "required|max:50",
            "zip_code" => "required|digits:4|numeric",
            "mobile_no" => "required|max:13|unique:crews"
        ]);

        Crew::create($validated);

        return response()->json([
            "message" => "Successfully created crew!"
        ]);
    }
}
