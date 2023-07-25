<script setup>
import DashboardLayout from '@/Layouts/DashboardLayout.vue';
import Modal from "@/Components/Modal.vue";
import InputError from '@/Components/InputError.vue';
import InputLabel from '@/Components/InputLabel.vue';
import TextInput from '@/Components/TextInput.vue';
import { Head, Link, router, useForm } from '@inertiajs/vue3';
import axios from 'axios';
import { reactive, ref } from "vue";

const props = defineProps({
	crew: Object,
	documents: {
		type: Array,
		default: []
	}	
});

const documents = ref([ ...props.documents]);

const documentAddUpdateModal = reactive({
	show: false,
	mode: 0,
	documentObject: {
		id: "",
		code: "",
		name: "",
		document_number: "",
		date_issued: "",
		date_expiry: "",
		remarks: ""
	}
});

const documentDeleteModal = reactive({
	show: false
});

const createDocument = async () => {
	let response = await axios.post(route('store_document', {
		crewId: props.crew.id
	}),
	{
		code: documentAddUpdateModal.documentObject.code,
		name: documentAddUpdateModal.documentObject.name,
		document_number: documentAddUpdateModal.documentObject.document_number,
		date_issued: documentAddUpdateModal.documentObject.date_issued,
		date_expiry: documentAddUpdateModal.documentObject.date_expiry,
		remarks: documentAddUpdateModal.documentObject.remarks
	});

	if (response.status != 200) {
		alert(response.data.message);
		return;
	}

	let newDocument = {
		...documentAddUpdateModal.documentObject
	};

	documents.value = [...documents.value, newDocument];

	alert(response.data.message);

	closeModal();
}

const updateDocument = async (id) => {
	let response = await axios.put(route('update_document', {
		crewId: props.crew.id,
		documentId: id
	}),
	{
		code: documentAddUpdateModal.documentObject.code,
		name: documentAddUpdateModal.documentObject.name,
		document_number: documentAddUpdateModal.documentObject.document_number,
		date_issued: documentAddUpdateModal.documentObject.date_issued,
		date_expiry: documentAddUpdateModal.documentObject.date_expiry,
		remarks: documentAddUpdateModal.documentObject.remarks
	});


	if (response.status != 200) {
		alert(response.data.message);
		return;
	}

	alert(response.data.message);

	let document = documents.value.find(document => document.id == id);
	document.code = documentAddUpdateModal.documentObject.code;
	document.name = documentAddUpdateModal.documentObject.name;
	document.document_number = documentAddUpdateModal.documentObject.document_number;
	document.date_issued = documentAddUpdateModal.documentObject.date_issued;
	document.date_expiry = documentAddUpdateModal.documentObject.date_expiry;

	closeModal();
}

const closeModal = () => {
	documentAddUpdateModal.show = false;
	documentAddUpdateModal.documentObject = {
		id: "",
		code: "",
		name: "",
		document_number: "",
		date_issued: "",
		date_expiry: "",
		remarks: ""
	};
}

const toggleAddModal = () => {
	documentAddUpdateModal.show = true;
	documentAddUpdateModal.mode = 0;
	documentAddUpdateModal.documentObject = {
		code: "",
		name: "",
		document_number: "",
		date_issued: "",
		date_expiry: "",
		remarks: ""
	};
}

const deleteDocument = async (id) => {

	if (!confirm("Are you sure you want to delete this document?"))
	{
		return;
	}

	let response = await axios.delete(route('delete_document', {
		crewId: props.crew.id,
		documentId: id
	}));

	if (response.status != 200) {
		alert(response.data.message);
		return;
	}

	alert(response.data.message);

	let document_index = documents.value.findIndex(document => document.id == id);
	documents.value = documents.value.toSpliced(document_index, 1);
}
</script>

<template>
	<DashboardLayout>

		<Head title="Crew Form" />

		<Modal :show="documentAddUpdateModal.show" @close="() => closeModal()">
			<div class = "p-5" v-if = "documentAddUpdateModal.mode == 0">
				<div class = "flex justify-between border-b border-gray">
					<span class = "text-lg">Add Document</span>
					<div>
						<button
							@click = "() => closeModal()"
							class = "rounded-full">X</button>
					</div>
				</div>
				<form id = "addDocument" class = "my-4" @submit.prevent="createDocument">
					<div>
						<InputLabel for="code" value="Code" />

						<TextInput id="code" type="text" class="mt-1 block w-full" v-model="documentAddUpdateModal.documentObject.code"
									required autofocus autocomplete="code" />
					</div>
					<div class = "mt-4">
						<InputLabel for="name" value="Name" />

						<TextInput id="name" type="text" class="mt-1 block w-full" v-model="documentAddUpdateModal.documentObject.name"
									required autofocus autocomplete="name" />
					</div>
					<div class = "mt-4">
						<InputLabel for="document_number" value="Document Number" />

						<TextInput id="document_number" type="text" class="mt-1 block w-full" v-model="documentAddUpdateModal.documentObject.document_number"
									required autofocus autocomplete="document_number" />
					</div>
					<div class = "mt-4">
						<InputLabel for="date_issued" value="Date Issued" />

						<TextInput id="date_issued" type="date" class="mt-1 block w-full" v-model="documentAddUpdateModal.documentObject.date_issued"
									required autofocus autocomplete="date_issued" />
					</div>
					<div class = "mt-4">
						<InputLabel for="date_expiry" value="Date Expiry" />

						<TextInput id="date_expiry" type="date" class="mt-1 block w-full" v-model="documentAddUpdateModal.documentObject.date_expiry"
									required autofocus autocomplete="date_expiry" />
					</div>
					<div class = "mt-4">
						<InputLabel for="remarks" value="Remarks" />

						<TextInput id="remarks" type="text" class="mt-1 block w-full" v-model="documentAddUpdateModal.documentObject.remarks"
									required autofocus autocomplete="remarks" />
					</div>
				</form>
				<div class = "pt-3 border-t-2 border-gray flex justify-end space-x-2">
					<button
						@click = "() => closeModal()" 
						class = "inline-block rounded bg-red-600 px-4 py-2 text-xs font-medium text-white hover:bg-red-700">Cancel</button>
					<button type = "submit" form = "addDocument" class = "inline-block rounded bg-blue-600 px-4 py-2 text-xs font-medium text-white hover:bg-blue-700">Add Document</button>
				</div>
			</div>
			<div class = "p-5" v-else>
				<div class = "flex justify-between">
					<span class = "text-lg">Update Document</span>
					<div>
						<button
							@click = "closeModal()"
							class = "p-5 rounded-full">X</button>
					</div>
				</div>
				<form id = "updateDocument" class = "my-4" @submit.prevent="updateDocument(documentAddUpdateModal.documentObject.id)">
					<div>
						<InputLabel for="code" value="Code" />

						<TextInput id="code" type="text" class="mt-1 block w-full" v-model="documentAddUpdateModal.documentObject.code"
									required autofocus autocomplete="code" />
					</div>
					<div class = "mt-4">
						<InputLabel for="name" value="Name" />

						<TextInput id="name" type="text" class="mt-1 block w-full" v-model="documentAddUpdateModal.documentObject.name"
									required autofocus autocomplete="name" />
					</div>
					<div class = "mt-4">
						<InputLabel for="document_number" value="Document Number" />

						<TextInput id="document_number" type="text" class="mt-1 block w-full" v-model="documentAddUpdateModal.documentObject.document_number"
									required autofocus autocomplete="document_number" />
					</div>
					<div class = "mt-4">
						<InputLabel for="date_issued" value="Date Issued" />

						<TextInput id="date_issued" type="date" class="mt-1 block w-full" v-model="documentAddUpdateModal.documentObject.date_issued"
									required autofocus autocomplete="date_issued" />
					</div>
					<div class = "mt-4">
						<InputLabel for="date_expiry" value="Date Expiry" />

						<TextInput id="date_expiry" type="date" class="mt-1 block w-full" v-model="documentAddUpdateModal.documentObject.date_expiry"
									required autofocus autocomplete="date_expiry" />
					</div>
					<div class = "mt-4">
						<InputLabel for="remarks" value="Remarks" />

						<TextInput id="remarks" type="text" class="mt-1 block w-full" v-model="documentAddUpdateModal.documentObject.remarks"
									required autofocus autocomplete="remarks" />
					</div>
				</form>
				<div class = "pt-3 border-t-2 border-black flex justify-end space-x-2">
					<button
						@click = "() => closeModal()" 
						class = "inline-block rounded bg-red-600 px-4 py-2 text-xs font-medium text-white hover:bg-red-700">Cancel</button>
					<button
						type = "submit"
						form = "updateDocument"
						class = "inline-block rounded bg-blue-600 px-4 py-2 text-xs font-medium text-white hover:bg-blue-700">Update Document</button>
				</div>
			</div>
		</Modal>

		<div class="py-12">
			<div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
				<div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
					<div class="p-5">
						<div class = "flex justify-between">
							<h2 class = "text-2xl font-bold text-gray-900 sm:text-3xl">Crew Information</h2>
							<div>
								<Link :href = "route('edit_crew_form', {
									id: props.crew.id
								})"
									class = "inline-block rounded bg-blue-600 px-4 py-2 text-sm font-medium text-white hover:bg-blue-700">
									Edit Crew Information
								</Link>
							</div>
						</div>
						<div class="mt-4 flex flex-column sm:flex-row space-x-2">
							<div class="basis-full sm:basis-4/12">
								<InputLabel for="first_name" value="First Name*" />

								<TextInput id="first_name" type="text" class="mt-1 block w-full" v-model="crew.first_name"
									required autofocus autocomplete="first_name" disabled />
							</div>

							<div class="basis-full sm:basis-4/12">
								<InputLabel for="last_name" value="Last Name*" />

								<TextInput id="last_name" type="text" class="mt-1 block w-full" v-model="crew.last_name"
									required autocomplete="last_name" disabled />

							</div>

							<div class="basis-full sm:basis-4/12">
								<InputLabel for="middle_name" value="Middle Name" />

								<TextInput id="middle_name" type="text" class="mt-1 block w-full" v-model="crew.middle_name"
									autocomplete="middle_name" disabled/>
							</div>
						</div>


						<div class="mt-4 flex space-x-2">
							<div class="basis-full sm:basis-4/12">
								<InputLabel for="email" value="Email*" />

								<TextInput id="email" type="email" class="mt-1 block w-full" v-model="crew.email" required
									autocomplete="email" disabled />
							</div>

							<div class="basis-4/12">
								<InputLabel for="mobile_no" value="Mobile Number*" />
								<TextInput minlength="13" maxlength="13" id="mobile_no" type="text"
									class="mt-1 block w-full" v-model="crew.mobile_no" required autocomplete="mobile_no" disabled />
							</div>
						</div>



						<div class="mt-4">
							<p class="text-lg">Address</p>
						</div>
						<div class="mt-2 flex flex-column sm:flex-row space-x-0 space-y-2 sm:space-x-2 sm:space-y-0">
							<div>
								<InputLabel for="house_no" value="House Number" />

								<TextInput id="house_no" type="text" class="mt-1 block w-full" v-model="crew.house_no"
									autocomplete="house_no" disabled />

							</div>

							<div>
								<InputLabel for="street" value="Street*" />

								<TextInput id="street" type="text" class="mt-1 block w-full" v-model="crew.street" required
									autocomplete="street" disabled />

							</div>

							<div>
								<InputLabel for="barangay" value="Barangay*" />

								<TextInput id="barangay" type="text" class="mt-1 block w-full" v-model="crew.barangay"
									required autocomplete="barangay" disabled />

							</div>

							<div>
								<InputLabel for="city_municipality" value="City/Municipality*" />

								<TextInput id="city_municipality" type="text" class="mt-1 block w-full"
									v-model="crew.city_municipality" required autocomplete="city_municipality" disabled/>

							</div>

							<div>
								<InputLabel for="province" value="Province*" />

								<TextInput id="province" type="text" class="mt-1 block w-full" v-model="crew.province"
									required autocomplete="province" disabled />

							</div>

							<div>
								<InputLabel for="zip_code" value="Zip Code*" />

								<TextInput maxlength="4" id="zip_code" type="text" class="mt-1 block w-full"
									v-model="crew.zip_code" required autocomplete="zip_code" disabled />

							</div>

						</div>

						<div class="mt-4">
							<InputLabel for="education" value="Education*" />

							<TextInput id="education" type="text" class="mt-1 block w-full" v-model="crew.education"
								required autocomplete="education" disabled />

						</div>

						<div class = "mt-8 flex justify-between">
							<h2 class = "text-xl font-bold text-gray-900 sm:text-2xl">Documents</h2>
							<div>
								<button
									@click = "toggleAddModal" 
									class="inline-block rounded bg-green-600 px-4 py-2 text-sm font-medium text-white hover:bg-green-700">
									Add Document
								</button>
							</div>
						</div>
						<div class=" mt-4 overflow-x-auto">
							<table class="min-w-full divide-y-2 divide-gray-200 bg-white text-sm">
								<thead class="ltr:text-left rtl:text-right">
									<tr>
										<th class="whitespace-nowrap px-4 py-2 font-medium text-gray-900">
											Code
										</th>
										<th class="whitespace-nowrap px-4 py-2 font-medium text-gray-900">
											Name
										</th>
										<th class="whitespace-nowrap px-4 py-2 font-medium text-gray-900">
											Date Issued
										</th>
										<th class="whitespace-nowrap px-4 py-2 font-medium text-gray-900">
											Date Expiry
										</th>
										<th class="px-4 py-2"></th>
									</tr>
								</thead>

								<tbody class="divide-y divide-gray-200">
									<tr v-if="documents.length == 0">
										<td colspan="99" class = "whitespace-nowrap px-4 py-2 font-medium text-gray-900">
											No document records assigned to this crew.
										</td>
									</tr>
									<tr v-for = "document in documents" :key = "document.id">
										<td class="whitespace-nowrap px-4 py-2 font-medium text-gray-900">
											{{ document.code }}
										</td>
										<td class="whitespace-nowrap px-4 py-2 text-gray-700">
											{{ document.name }}
										</td>
										<td class="whitespace-nowrap px-4 py-2 text-gray-700">
											{{ document.date_issued }}
										</td>
										<td class="whitespace-nowrap px-4 py-2 text-gray-700">
											{{ document.date_expiry }}
										</td>
										<td class="whitespace-nowrap px-4 py-2 flex space-x-2">
											<button
												@click = "() => {
													documentAddUpdateModal.show = true;
													documentAddUpdateModal.mode = 1;
													documentAddUpdateModal.documentObject = {
														...document
													}
												}"
												class="inline-block rounded bg-indigo-600 px-4 py-2 text-xs font-medium text-white hover:bg-indigo-700">
												Update Document
											</button>
											<button
												@click = "() => deleteDocument(document.id)"
												class = "inline-block rounded bg-red-600 px-4 py-2 text-xs font-medium text-white hover:bg-red-700">
												Delete Document
											</button>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</DashboardLayout>
</template>
