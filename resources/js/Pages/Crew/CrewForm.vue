<script setup>
import DashboardLayout from '@/Layouts/DashboardLayout.vue';
import InputError from '@/Components/InputError.vue';
import InputLabel from '@/Components/InputLabel.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';
import TextInput from '@/Components/TextInput.vue';
import { Head, Link, router, useForm } from '@inertiajs/vue3';
import { ref } from 'vue';
import axios from 'axios';

const props = defineProps({
	crew: Object,
	postUrl: Boolean,
	putUrl: Boolean,
	buttonName: String
})

const form = useForm({
	first_name: props.crew.first_name == undefined ? '' : props.crew.first_name,

	last_name: props.crew.last_name == undefined ? '' : props.crew.last_name,

	middle_name: props.crew.middle_name == undefined ? '' : props.crew.middle_name,

	email: props.crew.email == undefined ? '' : props.crew.email,

	house_no: props.crew.house_no == undefined ? '' : props.crew.house_no,

	street: props.crew.street == undefined ? '' : props.crew.street,

	barangay: props.crew.barangay == undefined ? '' : props.crew.barangay,

	city_municipality: props.crew.city_municipality == undefined ?
		'' : props.crew.city_municipality,

	province: props.crew.province == undefined ? '' : props.crew.province,

	zip_code: props.crew.zip_code == undefined ? '' : props.crew.zip_code,

	mobile_no: props.crew.mobile_no == undefined ? '' : props.crew.mobile_no,

	education: props.crew.education == undefined ? '' : props.crew.education
});

const clickable = ref(true);

const submit = async () => {
	clickable.value = false;

	if (props.postUrl) {
		
		let response = await axios.post(route('store_crew'), {
			...form
		});

		if (response.statusText != "OK") {
			alert(response.data.message);
			let keys = [];
			for (let [key, value] in Object.entries(response.data.errors))
			{
				keys.push({
					keyId: key,
					message: value.join("\n")
				});
			}


			keys.forEach(key => form.errors[key.keyId] = key.message)
		}

		alert(response.data.message);

		router.visit('/dashboard');
	}

	if (props.putUrl) {
		let response = await axios.put(route('update_crew', {
			id: props.crew.id
		}), {
			...form
		});

		if (response.statusText != "OK") {
			alert(response.data.message);
			let keys = [];
			for (let [key, value] in Object.entries(response.data.errors))
			{
				keys.push({
					keyId: key,
					message: value.join("\n")
				});
			}


			keys.forEach(key => form.errors[key.keyId] = key.message)
		}

		alert(response.data.message);

		router.visit("/dashboard");
	}
};
</script>

<template>
	<DashboardLayout>

		<Head title="Crew Form" />

		<div class="py-12">
			<div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
				<div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
					<form class="p-5" @submit.prevent="submit">
						<div class="flex space-x-2">
							<div class="basis-4/12">
								<InputLabel for="first_name" value="First Name*" />

								<TextInput id="first_name" type="text" class="mt-1 block w-full" v-model="form.first_name"
									required autofocus autocomplete="first_name" />

								<InputError class="mt-2" :message="form.errors.username" />
							</div>

							<div class="basis-4/12">
								<InputLabel for="last_name" value="Last Name*" />

								<TextInput id="last_name" type="text" class="mt-1 block w-full" v-model="form.last_name"
									required autocomplete="last_name" />

								<InputError class="mt-2" :message="form.errors.last_name" />
							</div>

							<div class="basis-4/12">
								<InputLabel for="middle_name" value="Middle Name" />

								<TextInput id="middle_name" type="text" class="mt-1 block w-full" v-model="form.middle_name"
									autocomplete="middle_name" />

								<InputError class="mt-2" :message="form.errors.middle_name" />
							</div>
						</div>


						<div class="mt-4 flex space-x-2">
							<div class="basis-4/12">
								<InputLabel for="email" value="Email*" />

								<TextInput id="email" type="email" class="mt-1 block w-full" v-model="form.email" required
									autocomplete="email" />

								<InputError class="mt-2" :message="form.errors.email" />
							</div>

							<div class="basis-4/12">
								<InputLabel for="mobile_no" value="Mobile Number*" />
								<TextInput minlength = "13" maxlength="13" id="mobile_no" type="text" class="mt-1 block w-full" v-model="form.mobile_no"
									required autocomplete="mobile_no" />
								<InputError class="mt-2" :message="form.errors.mobile_no" />
							</div>
						</div>



						<div class="mt-4">
							<p class="text-lg">Address</p>
						</div>
						<div class="mt-2 flex space-x-2">
							<div>
								<InputLabel for="house_no" value="House Number" />

								<TextInput id="house_no" type="text" class="mt-1 block w-full" v-model="form.house_no"
									autocomplete="house_no" />

								<InputError class="mt-2" :message="form.errors.house_no" />
							</div>

							<div>
								<InputLabel for="street" value="Street*" />

								<TextInput id="street" type="text" class="mt-1 block w-full" v-model="form.street" required
									autocomplete="street" />

								<InputError class="mt-2" :message="form.errors.street" />
							</div>

							<div>
								<InputLabel for="barangay" value="Barangay*" />

								<TextInput id="barangay" type="text" class="mt-1 block w-full" v-model="form.barangay"
									required autocomplete="barangay" />

								<InputError class="mt-2" :message="form.errors.barangay" />
							</div>

							<div>
								<InputLabel for="city_municipality" value="City/Municipality*" />

								<TextInput id="city_municipality" type="text" class="mt-1 block w-full"
									v-model="form.city_municipality" required autocomplete="city_municipality" />

								<InputError class="mt-2" :message="form.errors.city_municipality" />
							</div>

							<div>
								<InputLabel for="province" value="Province*" />

								<TextInput id="province" type="text" class="mt-1 block w-full" v-model="form.province"
									required autocomplete="province" />

								<InputError class="mt-2" :message="form.errors.province" />
							</div>

							<div>
								<InputLabel for="zip_code" value="Zip Code*" />

								<TextInput maxlength="4" id="zip_code" type="text" class="mt-1 block w-full" v-model="form.zip_code"
									required autocomplete="zip_code" />

								<InputError class="mt-2" :message="form.errors.zip_code" />
							</div>

						</div>

						<div class = "mt-4">
								<InputLabel for="education" value="Education*" />

								<TextInput id="education" type="text" class="mt-1 block w-full" v-model="form.education"
									required autocomplete="education" />

								<InputError class="mt-2" :message="form.errors.education" />
						</div>


						<div class="flex items-center justify-center mt-4">

							<PrimaryButton class="ml-4" :class="{ 'opacity-25': clickable.value }"
								:disabled="clickable.value">
								{{ props.buttonName }}
							</PrimaryButton>
						</div>
					</form>
				</div>
			</div>
		</div>
	</DashboardLayout>
</template>
