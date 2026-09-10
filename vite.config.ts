import adapter from 'svelte-adapter-deploy-stack';
import { sveltekit } from '@sveltejs/kit/vite';
import { defineConfig } from 'vite';

export default defineConfig({
	plugins: [
		sveltekit({
			adapter: adapter({
				region: 'us-east-2',
				size: 'micro'
			})
		})
	]
});