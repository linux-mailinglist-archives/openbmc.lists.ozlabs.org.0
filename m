Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4623132C4
	for <lists+openbmc@lfdr.de>; Mon,  8 Feb 2021 13:52:57 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZ5Xk1fN3zDqNk
	for <lists+openbmc@lfdr.de>; Mon,  8 Feb 2021 23:52:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::129;
 helo=mail-il1-x129.google.com; envelope-from=gmouse@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=nJNcln/Z; dkim-atps=neutral
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZ5Vk1tGFzDqTh
 for <openbmc@lists.ozlabs.org>; Mon,  8 Feb 2021 23:51:05 +1100 (AEDT)
Received: by mail-il1-x129.google.com with SMTP id o7so8067240ils.2
 for <openbmc@lists.ozlabs.org>; Mon, 08 Feb 2021 04:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=xFVeZJ7lz7AWqlAKx4YTcKAsAGR9dJOeBFypzvLIaw8=;
 b=nJNcln/ZQw3GsXyCVMUMay1+/yvMVlklemXiASGidMvx2cA7QhqVi4fmXshTR6j42x
 MuhhBgufL9ULTkYrkfwg3P8qpV3Fv4hfFhX4ki9+GRTsu8Z41PWZ6C8gm/CWNiYqUJAz
 ioW5n2OUkxg4MeJGvSRKfylyYk+3rM7W3pKmOrmdcyyzrWsHVRkGjlxwkhl8rU3gvvBE
 Jzd2bYIIqTRi1I2GSL9FhsstbY8GdFw44DWtk13LxTS1B4vhBv/FvF0kf82IpgEsPK19
 15QA4gXBbmj9kTNbPzJLcbfMI/9RF9ZJ5Q/1TlUEHhD2t70IkQWUoH0D3QD3z8ePcRoh
 cUAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=xFVeZJ7lz7AWqlAKx4YTcKAsAGR9dJOeBFypzvLIaw8=;
 b=HygC05g1DmiAOAkTa8bI6C17vHnkgD9a/a61+hLMC+PKYxZSi4zuJcUI4EezEjJU/P
 uTuftd1OSZgH6RSztUhtvH8dQwuc3OCnO885ZidygILciHlApH5ffFIdZ6SL5A05n6oC
 nZjxCWXL0FQr3fwX/HaRdVpFm93BuCxZ7IgesXrf8p/HIPyJLUcu9WkFY+xBOldRv0Wy
 lp4Zn9WHQhJ7dw+M0UqAvzWXVdz3KlRc1unsfjsWu0cszzpUjETdSBY4aP7NltaVexQf
 KSWkjzM2M06DyC7WJD49jPIlYtSyz01rWtG7zABU67sORPK0m1tIxiXuAVDnJ/H4/lx5
 cTGw==
X-Gm-Message-State: AOAM530ZKZnr+NzsOhXHy4Q6wxdhDYojdV4z1m0nK/SiyaEOKXQglNqK
 NeTzuvUO1X+7c98CJuSpEp1z3E1Uk/lu1d3wH32g8XjgTtM=
X-Google-Smtp-Source: ABdhPJypWJABn2TgWs000rTBgvF8u4vlXH171FP3V5MmezWgW9A76bhWqBSjjHFlTDYjv4oN/bInliEW8N5b+MpQR7c=
X-Received: by 2002:a05:6e02:1ca4:: with SMTP id
 x4mr8716445ill.58.1612788662645; 
 Mon, 08 Feb 2021 04:51:02 -0800 (PST)
MIME-Version: 1.0
References: <CADVsX8_ua6nShjGQbK1nVqsn34+dArF69sCLcLt6U+0_zXj54w@mail.gmail.com>
In-Reply-To: <CADVsX8_ua6nShjGQbK1nVqsn34+dArF69sCLcLt6U+0_zXj54w@mail.gmail.com>
From: Anton Kachalov <rnouse@google.com>
Date: Mon, 8 Feb 2021 13:50:50 +0100
Message-ID: <CADVsX8_M3DdUTY7Y0gubD18eSUufA1bzcjRZgOnVgg1xP9SMNQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: nuvoton: Fix flash layout
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Here is base64 encoded patch:

=== CUT ===
RnJvbSAwMTBhYTg5ODI2ZjUxZjNjMTc2MTY1YjU5YWJmZTcyYmFhZmYxYzhkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiAiQW50b24gRC4gS2FjaGFsb3YiIDxnbW91c2VAZ29vZ2xlLmNv
bT4KRGF0ZTogU3VuLCA3IEZlYiAyMDIxIDE4OjUxOjQ4ICswMTAwClN1YmplY3Q6IFtQQVRDSF0g
QVJNOiBkdHM6IG51dm90b246IEZpeCBmbGFzaCBsYXlvdXQKIFRoaXMgY2hhbmdlIHNhdGlzZnkg
T3BlbkJNQyByZXF1aXJlbWVudHMgZm9yIGZsYXNoIGxheW91dC4KClNpZ25lZC1vZmYtYnk6IEFu
dG9uIEQuIEthY2hhbG92IDxnbW91c2VAZ29vZ2xlLmNvbT4KLS0tCiBhcmNoL2FybS9ib290L2R0
cy9udXZvdG9uLW5wY203NTAtZXZiLmR0cyB8IDI4ICsrKysrKystLS0tLS0tLS0tLS0tLS0tCiAx
IGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAyMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9hcmNoL2FybS9ib290L2R0cy9udXZvdG9uLW5wY203NTAtZXZiLmR0cyBiL2FyY2gvYXJt
L2Jvb3QvZHRzL251dm90b24tbnBjbTc1MC1ldmIuZHRzCmluZGV4IGJkMWViNmVlMzgwZi4uNzQx
YzFmZWU4NTUyIDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9udXZvdG9uLW5wY203NTAt
ZXZiLmR0cworKysgYi9hcmNoL2FybS9ib290L2R0cy9udXZvdG9uLW5wY203NTAtZXZiLmR0cwpA
QCAtMTgyLDggKzE4Miw4IEBAIGJidWJvb3QyQDgwMDAwIHsKIAkJCQlyZWcgPSA8MHgwMDgwMDAw
IDB4ODAwMDA+OwogCQkJCXJlYWQtb25seTsKIAkJCQl9OwotCQkJZW52cGFyYW1AMTAwMDAwIHsK
LQkJCQlsYWJlbCA9ICJlbnYtcGFyYW0iOworCQkJdWJvb3RlbnZAMTAwMDAwIHsKKwkJCQlsYWJl
bCA9ICJ1LWJvb3QtZW52IjsKIAkJCQlyZWcgPSA8MHgwMTAwMDAwIDB4NDAwMDA+OwogCQkJCXJl
YWQtb25seTsKIAkJCQl9OwpAQCAtMTk1LDI1ICsxOTUsMTMgQEAga2VybmVsQDIwMDAwMCB7CiAJ
CQkJbGFiZWwgPSAia2VybmVsIjsKIAkJCQlyZWcgPSA8MHgwMjAwMDAwIDB4NDAwMDAwPjsKIAkJ
CQl9OwotCQkJcm9vdGZzQDYwMDAwMCB7Ci0JCQkJbGFiZWwgPSAicm9vdGZzIjsKLQkJCQlyZWcg
PSA8MHgwNjAwMDAwIDB4NzAwMDAwPjsKKwkJCXJvZnNANzgwMDAwIHsKKwkJCQlsYWJlbCA9ICJy
b2ZzIjsKKwkJCQlyZWcgPSA8MHgwNzgwMDAwIDB4MTY4MDAwMD47CiAJCQkJfTsKLQkJCXNwYXJl
MUBEMDAwMDAgewotCQkJCWxhYmVsID0gInNwYXJlMSI7Ci0JCQkJcmVnID0gPDB4MEQwMDAwMCAw
eDIwMDAwMD47Ci0JCQkJfTsKLQkJCXNwYXJlMkAwRjAwMDAwIHsKLQkJCQlsYWJlbCA9ICJzcGFy
ZTIiOwotCQkJCXJlZyA9IDwweDBGMDAwMDAgMHgyMDAwMDA+OwotCQkJCX07Ci0JCQlzcGFyZTNA
MTEwMDAwMCB7Ci0JCQkJbGFiZWwgPSAic3BhcmUzIjsKLQkJCQlyZWcgPSA8MHgxMTAwMDAwIDB4
MjAwMDAwPjsKLQkJCQl9OwotCQkJc3BhcmU0QDEzMDAwMDAgewotCQkJCWxhYmVsID0gInNwYXJl
NCI7Ci0JCQkJcmVnID0gPDB4MTMwMDAwMCAweDA+OworCQkJcndmc0AxZTAwMDAwIHsKKwkJCQls
YWJlbCA9ICJyd2ZzIjsKKwkJCQlyZWcgPSA8MHgxZTAwMDAwIDB4MjAwMDAwPjsKIAkJCX07CiAJ
CX07CiAJfTsKLS0gCjIuMzAuMC40NzguZzhhMGQxNzhjMDEtZ29vZwoK
=== /CUT ===

On Sun, 7 Feb 2021 at 18:58, Anton Kachalov <rnouse@google.com> wrote:
>
> This change satisfies OpenBMC requirements for flash layout.
>
> Signed-off-by: Anton D. Kachalov <gmouse@google.com>
> ---
>  arch/arm/boot/dts/nuvoton-npcm750-evb.dts | 28 +++++++----------------
>  1 file changed, 8 insertions(+), 20 deletions(-)
>
> diff --git a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> index bd1eb6ee380f..741c1fee8552 100644
> --- a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> +++ b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> @@ -182,8 +182,8 @@ bbuboot2@80000 {
>   reg = <0x0080000 0x80000>;
>   read-only;
>   };
> - envparam@100000 {
> - label = "env-param";
> + ubootenv@100000 {
> + label = "u-boot-env";
>   reg = <0x0100000 0x40000>;
>   read-only;
>   };
> @@ -195,25 +195,13 @@ kernel@200000 {
>   label = "kernel";
>   reg = <0x0200000 0x400000>;
>   };
> - rootfs@600000 {
> - label = "rootfs";
> - reg = <0x0600000 0x700000>;
> + rofs@780000 {
> + label = "rofs";
> + reg = <0x0780000 0x1680000>;
>   };
> - spare1@D00000 {
> - label = "spare1";
> - reg = <0x0D00000 0x200000>;
> - };
> - spare2@0F00000 {
> - label = "spare2";
> - reg = <0x0F00000 0x200000>;
> - };
> - spare3@1100000 {
> - label = "spare3";
> - reg = <0x1100000 0x200000>;
> - };
> - spare4@1300000 {
> - label = "spare4";
> - reg = <0x1300000 0x0>;
> + rwfs@1e00000 {
> + label = "rwfs";
> + reg = <0x1e00000 0x200000>;
>   };
>   };
>   };
> --
> 2.30.0.478.g8a0d178c01-goog
>
>
