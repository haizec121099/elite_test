<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { Head, Link } from '@inertiajs/vue3';
import {ref } from "vue";
const props = defineProps({
    crews: Array
})

const crews = ref(props.crews);

const deleteCrew = async (id) => {
    const response = await axios.delete(route('delete_crew', {
        id: id
    }));

    if (response.status != 200) {
        alert(response.data.message);
        return;
    }

    alert(response.data.message);

    const crew_index = crews.value.findIndex(crew => crew.id == id)
    crews.value = crews.value.toSpliced(crew_index, 1);
}
</script>

<template>
    <Head title="Dashboard" />

    <AuthenticatedLayout>
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">Dashboard</h2>
        </template>

        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                    <div class="bg-white p-5">
                        <div class="flex justify-between">
                            <h2 class="text-lg font-bold text-gray-900 sm:text-2xl">Crews</h2>
                            <div>
                                <Link :href="route('crew_form')"
                                    class="px-5 py-3 bg-green-500 rounded text-white hover:bg-green-600">Add Crew</Link>
                            </div>
                        </div>
                        <div class="mt-8">
                            <div class="overflow-x-auto">
                                <table class="min-w-full divide-y-2 divide-gray-200 bg-white text-sm">
                                    <thead class="ltr:text-left rtl:text-right">
                                        <tr>
                                            <th class="whitespace-nowrap px-4 py-2 font-medium text-gray-900">
                                                First Name
                                            </th>
                                            <th class="whitespace-nowrap px-4 py-2 font-medium text-gray-900">
                                                Last Name
                                            </th>
                                            <th class="whitespace-nowrap px-4 py-2 font-medium text-gray-900">
                                                Middle Name
                                            </th>
                                            <th class="whitespace-nowrap px-4 py-2 font-medium text-gray-900">
                                                Email
                                            </th>
                                            <th class="px-4 py-2"></th>
                                        </tr>
                                    </thead>

                                    <tbody class="divide-y divide-gray-200">
                                        <tr v-for="crew in crews" :key = "crew.id">
                                            <td class="whitespace-nowrap px-4 py-2 font-medium text-gray-900">
                                                {{ crew.first_name }}
                                            </td>
                                            <td class="whitespace-nowrap px-4 py-2 text-gray-700">
                                                {{ crew.last_name }}
                                            </td>
                                            <td class="whitespace-nowrap px-4 py-2 text-gray-700">
                                                {{ crew.middle_name }}
                                            </td>
                                            <td class="whitespace-nowrap px-4 py-2 text-gray-700">
                                                {{ crew.email }}
                                            </td>
                                            <td class="whitespace-nowrap px-4 py-2">
                                                
                                                <span
                                                    class="inline-flex space-x-2 overflow-hidden rounded-md border bg-white shadow-sm">

                                                    <Link :href="route('view_crew', { id: crew.id })"
                                                        class="inline-block rounded bg-indigo-600 px-4 py-2 text-xs font-medium text-white hover:bg-indigo-700 focus:relative">
                                                        View
                                                    </Link>

                                                    <button
                                                        @click = "() => deleteCrew(crew.id)"
                                                        class="inline-block rounded bg-red-600 px-4 py-2 text-xs font-medium text-white hover:bg-red-700 focus:relative">
                                                        Delete
                                                    </button>
                                                </span>

                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </AuthenticatedLayout>
</template>
