# Linux Kernel: Describe Your Changes

Source: [Submitting Patches](https://www.kernel.org/doc/html/latest/process/submitting-patches.html)

## Describe your changes

Describe your problem. Whether your patch is a one-line bug fix or 5000 lines of a new feature, there must be an underlying problem that motivated you to do this work. Convince the reviewer that there is a problem worth fixing and that it makes sense for them to read past the first paragraph.

Describe user-visible impact. Straight up crashes and lockups are pretty convincing, but not all bugs are that blatant. Even if the problem was spotted during code review, describe the impact you think it can have on users. Keep in mind that the majority of Linux installations run kernels from secondary stable trees or vendor/product-specific trees that cherry-pick only specific patches from upstream, so include anything that could help route your change downstream: provoking circumstances, excerpts from dmesg, crash descriptions, performance regressions, latency spikes, lockups, etc.

Quantify optimizations and trade-offs. If you claim improvements in performance, memory consumption, stack footprint, or binary size, include numbers that back them up. But also describe non-obvious costs. Optimizations usually aren't free but trade-offs between CPU, memory, and readability; or, when it comes to heuristics, between different workloads. Describe the expected downsides of your optimization so that the reviewer can weigh costs against benefits.

Once the problem is established, describe what you are actually doing about it in technical detail. It's important to describe the change in plain English for the reviewer to verify that the code is behaving as you intend it to.

Solve only one problem per patch. If your description starts to get long, that's a sign that you probably need to split up your patch.

When you submit or resubmit a patch or patch series, include the complete patch description and justification for it. Don't just say that this is version N of the patch (series). Don't expect the subsystem maintainer to refer back to earlier patch versions or referenced URLs to find the patch description and put that into the patch. I.e., the patch (series) and its description should be self-contained.

Describe your changes in imperative mood, e.g. "make xyzzy do frotz" instead of "[This patch] makes xyzzy do frotz" or "[I] changed xyzzy to do frotz", as if you are giving orders to the codebase to change its behaviour.

If you want to refer to a specific commit, don't just refer to the SHA-1 ID of the commit. Please also include the oneline summary of the commit, to make it easier for reviewers to know what it is about.

## Separate your changes

Separate each logical change into a separate patch. For example, if your changes include both bug fixes and performance enhancements for a single driver, separate those changes into two or more patches. If you changes include an API update, and a new driver which uses that new API, separate those into two patches. On the other hand, if you make a single change to numerous files, group those changes into a single patch. Thus a single logical change is contained within a single patch.

The point to remember is that each patch should make an easily understood change that can be verified by reviewers. Each patch should be justifiable on its own merits.

If one patch depends on another patch in order for a change to be complete, that is OK. Simply note "this patch depends on patch X" in your patch description.

When dividing your change into a series of patches, take special care to ensure that the kernel builds and runs properly after each patch in the series.

## Using Assisted-by

Source: [Coding Assistants](https://docs.kernel.org/process/coding-assistants.html)

If you used any sort of advanced coding tool in the creation of your patch, you need to acknowledge that use by adding an Assisted-by tag. Failure to do so may impede the acceptance of your work.

Format:
```
Assisted-by: AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]
```

- `AGENT_NAME` is the name of the AI tool or framework
- `MODEL_VERSION` is the specific model version used
- `[TOOL1] [TOOL2]` are optional specialized analysis tools (e.g., coccinelle, sparse, smatch, clang-tidy)
- Do not list basic development tools (git, gcc, make, editors)

Example:
```
Assisted-by: Claude:claude-3-opus coccinelle sparse
```

Note: AI agents MUST NOT add `Signed-off-by` tags. Only humans can legally certify the Developer Certificate of Origin (DCO).
