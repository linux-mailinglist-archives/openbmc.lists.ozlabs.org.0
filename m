Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BB5850C23
	for <lists+openbmc@lfdr.de>; Mon, 12 Feb 2024 00:15:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=ID2F74d5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TY3ND3PQhz3cGW
	for <lists+openbmc@lfdr.de>; Mon, 12 Feb 2024 10:15:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=ID2F74d5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.de (client-ip=212.227.15.18; helo=mout.gmx.net; envelope-from=deller@gmx.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 345 seconds by postgrey-1.37 at boromir; Thu, 08 Feb 2024 18:09:19 AEDT
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TVp4v3fYGz30Dg
	for <openbmc@lists.ozlabs.org>; Thu,  8 Feb 2024 18:09:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1707376151; x=1707980951; i=deller@gmx.de;
	bh=uPLCZRgDaIadbtMF2//aJx5zwFVadHIP7fergVohN/I=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=ID2F74d5RzHFGPbRL3DaMcBgNzrnvTTL5mN3OBhYHcAQFr+roV5kgAngshTgG6m0
	 XFHWDBp2ntXcQ7xNmC/wvWKRkXTZ7R6+SvKCbq0PoHyetVTy6aJswl38w/4lHBjt0
	 nriRHc0bB11hmE76mGbH87e66d4dVvYWolf7A3Pt2iZY5MPm7P0B2fF+vqu9heZJE
	 7b5022mgT2I/GsMj4ogRcEDaJgAH8jqy4XMlrzSQXKSLUYcqkP/CoieQK3yZSAYvG
	 anCS3mJqEPpvZ+AdRM7dTKvSk+NC5p5en8cTm1LkbIKDfw7Ewk1XM22Imjd8us7S6
	 YaoABdc63uP+AsqsQw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([94.134.159.68]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MCKFk-1rhI6H2H3q-009Orf; Thu, 08
 Feb 2024 08:02:31 +0100
Message-ID: <385d72eb-2443-42e5-858d-0cc083a29a26@gmx.de>
Date: Thu, 8 Feb 2024 08:02:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] ARM: prctl: Reject PR_SET_MDWE where not supported
To: Zev Weiss <zev@bewilderbeest.net>, linux-parisc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Florent Revest <revest@chromium.org>
References: <20240208012620.32604-4-zev@bewilderbeest.net>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 xsFNBF3Ia3MBEAD3nmWzMgQByYAWnb9cNqspnkb2GLVKzhoH2QD4eRpyDLA/3smlClbeKkWT
 HLnjgkbPFDmcmCz5V0Wv1mKYRClAHPCIBIJgyICqqUZo2qGmKstUx3pFAiztlXBANpRECgwJ
 r+8w6mkccOM9GhoPU0vMaD/UVJcJQzvrxVHO8EHS36aUkjKd6cOpdVbCt3qx8cEhCmaFEO6u
 CL+k5AZQoABbFQEBocZE1/lSYzaHkcHrjn4cQjc3CffXnUVYwlo8EYOtAHgMDC39s9a7S90L
 69l6G73lYBD/Br5lnDPlG6dKfGFZZpQ1h8/x+Qz366Ojfq9MuuRJg7ZQpe6foiOtqwKym/zV
 dVvSdOOc5sHSpfwu5+BVAAyBd6hw4NddlAQUjHSRs3zJ9OfrEx2d3mIfXZ7+pMhZ7qX0Axlq
 Lq+B5cfLpzkPAgKn11tfXFxP+hcPHIts0bnDz4EEp+HraW+oRCH2m57Y9zhcJTOJaLw4YpTY
 GRUlF076vZ2Hz/xMEvIJddRGId7UXZgH9a32NDf+BUjWEZvFt1wFSW1r7zb7oGCwZMy2LI/G
 aHQv/N0NeFMd28z+deyxd0k1CGefHJuJcOJDVtcE1rGQ43aDhWSpXvXKDj42vFD2We6uIo9D
 1VNre2+uAxFzqqf026H6cH8hin9Vnx7p3uq3Dka/Y/qmRFnKVQARAQABzRxIZWxnZSBEZWxs
 ZXIgPGRlbGxlckBnbXguZGU+wsGRBBMBCAA7AhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheA
 FiEERUSCKCzZENvvPSX4Pl89BKeiRgMFAl3J1zsCGQEACgkQPl89BKeiRgNK7xAAg6kJTPje
 uBm9PJTUxXaoaLJFXbYdSPfXhqX/BI9Xi2VzhwC2nSmizdFbeobQBTtRIz5LPhjk95t11q0s
 uP5htzNISPpwxiYZGKrNnXfcPlziI2bUtlz4ke34cLK6MIl1kbS0/kJBxhiXyvyTWk2JmkMi
 REjR84lCMAoJd1OM9XGFOg94BT5aLlEKFcld9qj7B4UFpma8RbRUpUWdo0omAEgrnhaKJwV8
 qt0ULaF/kyP5qbI8iA2PAvIjq73dA4LNKdMFPG7Rw8yITQ1Vi0DlDgDT2RLvKxEQC0o3C6O4
 iQq7qamsThLK0JSDRdLDnq6Phv+Yahd7sDMYuk3gIdoyczRkXzncWAYq7XTWl7nZYBVXG1D8
 gkdclsnHzEKpTQIzn/rGyZshsjL4pxVUIpw/vdfx8oNRLKj7iduf11g2kFP71e9v2PP94ik3
 Xi9oszP+fP770J0B8QM8w745BrcQm41SsILjArK+5mMHrYhM4ZFN7aipK3UXDNs3vjN+t0zi
 qErzlrxXtsX4J6nqjs/mF9frVkpv7OTAzj7pjFHv0Bu8pRm4AyW6Y5/H6jOup6nkJdP/AFDu
 5ImdlA0jhr3iLk9s9WnjBUHyMYu+HD7qR3yhX6uWxg2oB2FWVMRLXbPEt2hRGq09rVQS7DBy
 dbZgPwou7pD8MTfQhGmDJFKm2jvOwU0EXchrcwEQAOsDQjdtPeaRt8EP2pc8tG+g9eiiX9Sh
 rX87SLSeKF6uHpEJ3VbhafIU6A7hy7RcIJnQz0hEUdXjH774B8YD3JKnAtfAyuIU2/rOGa/v
 UN4BY6U6TVIOv9piVQByBthGQh4YHhePSKtPzK9Pv/6rd8H3IWnJK/dXiUDQllkedrENXrZp
 eLUjhyp94ooo9XqRl44YqlsrSUh+BzW7wqwfmu26UjmAzIZYVCPCq5IjD96QrhLf6naY6En3
 ++tqCAWPkqKvWfRdXPOz4GK08uhcBp3jZHTVkcbo5qahVpv8Y8mzOvSIAxnIjb+cklVxjyY9
 dVlrhfKiK5L+zA2fWUreVBqLs1SjfHm5OGuQ2qqzVcMYJGH/uisJn22VXB1c48yYyGv2HUN5
 lC1JHQUV9734I5cczA2Gfo27nTHy3zANj4hy+s/q1adzvn7hMokU7OehwKrNXafFfwWVK3OG
 1dSjWtgIv5KJi1XZk5TV6JlPZSqj4D8pUwIx3KSp0cD7xTEZATRfc47Yc+cyKcXG034tNEAc
 xZNTR1kMi9njdxc1wzM9T6pspTtA0vuD3ee94Dg+nDrH1As24uwfFLguiILPzpl0kLaPYYgB
 wumlL2nGcB6RVRRFMiAS5uOTEk+sJ/tRiQwO3K8vmaECaNJRfJC7weH+jww1Dzo0f1TP6rUa
 fTBRABEBAAHCwXYEGAEIACAWIQRFRIIoLNkQ2+89Jfg+Xz0Ep6JGAwUCXchrcwIbDAAKCRA+
 Xz0Ep6JGAxtdEAC54NQMBwjUNqBNCMsh6WrwQwbg9tkJw718QHPw43gKFSxFIYzdBzD/YMPH
 l+2fFiefvmI4uNDjlyCITGSM+T6b8cA7YAKvZhzJyJSS7pRzsIKGjhk7zADL1+PJei9p9idy
 RbmFKo0dAL+ac0t/EZULHGPuIiavWLgwYLVoUEBwz86ZtEtVmDmEsj8ryWw75ZIarNDhV74s
 BdM2ffUJk3+vWe25BPcJiaZkTuFt+xt2CdbvpZv3IPrEkp9GAKof2hHdFCRKMtgxBo8Kao6p
 Ws/Vv68FusAi94ySuZT3fp1xGWWf5+1jX4ylC//w0Rj85QihTpA2MylORUNFvH0MRJx4mlFk
 XN6G+5jIIJhG46LUucQ28+VyEDNcGL3tarnkw8ngEhAbnvMJ2RTx8vGh7PssKaGzAUmNNZiG
 MB4mPKqvDZ02j1wp7vthQcOEg08z1+XHXb8ZZKST7yTVa5P89JymGE8CBGdQaAXnqYK3/yWf
 FwRDcGV6nxanxZGKEkSHHOm8jHwvQWvPP73pvuPBEPtKGLzbgd7OOcGZWtq2hNC6cRtsRdDx
 4TAGMCz4j238m+2mdbdhRh3iBnWT5yPFfnv/2IjFAk+sdix1Mrr+LIDF++kiekeq0yUpDdc4
 ExBy2xf6dd+tuFFBp3/VDN4U0UfG4QJ2fg19zE5Z8dS4jGIbLg==
In-Reply-To: <20240208012620.32604-4-zev@bewilderbeest.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xUHXoor0X0Tczwb0phFhyiIkBZYuYO1Y7oAoH+bcsfFdDXzGiX/
 4cDLml5CNyNLnGrMvK9WLmm+5iAGEVfqyaPsGd1wjJ+xyY84h2PrjQn7bK8Dr1nb/ENlwgS
 74COURsfhqrAnFZ13QBBkTYNB1oN1gxE0OO0PopLxf3SxoWi667u+Lj0bMOm+wIgV4mn/bg
 qJ3cr7DEFJbWCR7o2a5iw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:2VIHqa+zh2o=;9MrmS8vZBX5KR8x34eHBl2/JgI7
 zZVMqr/WERAxKm5TOpA7HgV/vfJxtmhoHB2hpC6UeCWbfHXuTE/JbWWL59G43x85zm7YCT4Nh
 4XOf2Tfc250vdML0fcKllni7RdVw6vYKy5xqrC2D+gyYtUfHUAVKj7QY/25Glrri2NY8OtoDW
 AIHybv9XXQREd5dWrehYdArl4Y+sy8RKPYNGMdwImkc+DAVu0s9bt1q/9XLGGv/aFnbfdwR/o
 /T6jAhZZtu9dGk+8bfSjuWHF0DREAFwtWZapOd2clEDI3baoM1l9ji5xf83IVHX8PD5V8LTdQ
 DOeiNwsY/KEdf4B76TMWlT23TP566o5au1uH7G3vxNRJZs3hwWFuMdrUUq1TwXpclPjb7PgD1
 ULZ+54RD4EcpONBVluFY2Jr3FZ2y0eexpjYbuzVC276qPu/wXITHDn79yOrsj6f4S1EieLqsn
 S8J5pv0huLcKMkbm4A74KfwjTBwzy02+s6oIG6DUph/xUs0geJFk9A0lhrgw50f8QM9QbGKQO
 7PPi0Ybpd7vXk5OpIq0AGf5ThsMCD2uwuYRyIGTuMnrmLmIB5H6q8dj4/Srb6L4F0noA4yNMv
 iLfH9l/B9yqFTreH8x5AG78GOBwcAB6WgGcO53lfpOTN34smQSoS9wr7QMFz46UD0EB//Xb8A
 II3WnvJROuXlm6ECgWH4CZcbQ80LTWIxBhgRHTBAUH2JBULyLCe8PM7MEnSa3JTlVrMLAjopt
 6Nn29HKoTtfIUhlwbM8JcCF0Tz8X4LGFx9Hs0AzBjnYCMPVVbW6C3/wgsV3UO81w1VN/e23oa
 O9XHKa9BzMTuIsjFEEdU6ailU7L0QHpCi7t6FlE7zcA18=
X-Mailman-Approved-At: Mon, 12 Feb 2024 10:14:56 +1100
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: Sam James <sam@gentoo.org>, Ondrej Mosnacek <omosnace@redhat.com>, Stefan Roesch <shr@devkernel.io>, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, David Hildenbrand <david@redhat.com>, Oleg Nesterov <oleg@redhat.com>, stable@vger.kernel.org, Josh Triplett <josh@joshtriplett.org>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, "Borislav Petkov \(AMD\)" <bp@alien8.de>, Yang Shi <yang@os.amperecomputing.com>, Miguel Ojeda <ojeda@kernel.org>, Russell King <linux@armlinux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, "Mike Rapoport \(IBM\)" <rppt@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Zev,

On 2/8/24 02:26, Zev Weiss wrote:
> Hello,
>
> I noticed after a recent kernel update that my ARM926 system started
> segfaulting on any execve() after calling prctl(PR_SET_MDWE).  After
> some investigation it appears that ARMv5 is incapable of providing the
> appropriate protections for MDWE, since any readable memory is also
> implicitly executable.
>
> (Note that I'm not an expert in either ARM arch details or the mm
> subsystem, so please bear with me if I've botched something in the
> above analysis.)
>
> The prctl_set_mdwe() function already had some special-case logic
> added disabling it on PARISC (commit 793838138c15, "prctl: Disable
> prctl(PR_SET_MDWE) on parisc"); this patch series (1) generalizes that
> check to use an arch_*() function, and (2) adds a corresponding
> override for ARM to disable MDWE on pre-ARMv6 CPUs.

Instead of splitting it out to a new function in mman.h,
I'd prefer having it as config option, e.g. ARCH_HAS_NO_MDWE_SUPPORT (?)
which could be checked instead.
For parisc we still want to allow mdwe in the future, we just have
to wait until most user-space programs have updated to the latest
binaries which don't need an executable stack any longer.

> With the series applied, prctl(PR_SET_MDWE) is rejected on ARMv5 and
> subsequent execve() calls (as well as mmap(PROT_READ|PROT_WRITE)) can
> succeed instead of unconditionally failing; on ARMv6 the prctl works
> as it did previously.
>
> Since this was effectively a userspace-breaking change in v6.3 (with
> newer MDWE-aware userspace on older pre-MDWE kernels the prctl would
> simply fail safely) I've CCed -stable for v6.3+, though since the
> patches depend on the PARISC one above it will only apply cleanly on
> the linux-6.6.y and linux-6.7.y branches, since at least at time of
> writing the 6.3 through 6.5 branches don't have that patch backported
> (due to further missing dependencies [0]).
> [0] https://lore.kernel.org/all/2023112456-linked-nape-bf19@gregkh/

I think you don't need to worry about that, since stable kernel series
for 6.3 up to 6.5 were stopped...

> Zev Weiss (2):
>    prctl: Generalize PR_SET_MDWE support check to be per-arch
>    ARM: prctl: Reject PR_SET_MDWE on pre-ARMv6
>
>   arch/arm/include/asm/mman.h    | 14 ++++++++++++++
>   arch/parisc/include/asm/mman.h | 14 ++++++++++++++
>   include/linux/mman.h           |  8 ++++++++
>   kernel/sys.c                   |  7 +++++--
>   4 files changed, 41 insertions(+), 2 deletions(-)
>   create mode 100644 arch/arm/include/asm/mman.h
>   create mode 100644 arch/parisc/include/asm/mman.h
>

