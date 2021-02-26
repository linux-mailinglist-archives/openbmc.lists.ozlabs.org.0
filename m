Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2B33267E3
	for <lists+openbmc@lfdr.de>; Fri, 26 Feb 2021 21:11:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DnLQ14mspz30NL
	for <lists+openbmc@lfdr.de>; Sat, 27 Feb 2021 07:11:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=SwwewyHi;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::12c;
 helo=mail-il1-x12c.google.com; envelope-from=gmouse@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=SwwewyHi; dkim-atps=neutral
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DnLPl5hzjz3cXx
 for <openbmc@lists.ozlabs.org>; Sat, 27 Feb 2021 07:10:48 +1100 (AEDT)
Received: by mail-il1-x12c.google.com with SMTP id d5so9106606iln.6
 for <openbmc@lists.ozlabs.org>; Fri, 26 Feb 2021 12:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VJpHuXGBmsxLVAiCHOrWfj0MsXAHdKn9m8eHPt49q0M=;
 b=SwwewyHi3cAlAmgAbgygXwMDrhLOFdyJGLBJdRH4I3Yx+SOFrEC3MiwrsFl+re5gXg
 7np2jQd1pcKCoQ+Of+F1noS8UENjDS7FuI4TfHdQtGwGTy3rriEFJ+KHSzNc0aamHPnp
 GJT0aMsEE9PpHe6YaoMadxTBvt8VWdl9GyFEYegVBSeqJWFPvkIb8CYdlys4Afi5ZYJQ
 C6N7Z0wnXaBQFgE0p+SaEW+IPA0CwF0Hz7z+FqjhUU2/GLOa2fVbLNVIUozXQ3X8Nm3F
 KocAIUsgV/U6AD8M2klx6ZPaeu97N07JMfaecIwhGgNtAD3wAMu5M8RIzDsbJdFjF8Gk
 H3lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VJpHuXGBmsxLVAiCHOrWfj0MsXAHdKn9m8eHPt49q0M=;
 b=Plvhwm/CSOdeKxeLGSQqgyMb+e7++tfPHLS+TiDqBx9rCxct+qCJ5c2Oyc1g6EXUpa
 cSLX8xwI/N4YNf+cbUeR63iwCJBiNZX8VBOM7Hu4IeNa9aUrRcekxQgVWkmavflK91ru
 aYBJYvH0MwZey7rH7Xek33O37LLLYO6x/jNNKIGg68wy8j2TK2BX2qNxGIB+axKq6aPz
 xq2uTTjLPXPuOMDjSp2SHhxX/5kb8QvKU54SsxPDx+sd1Ev1hjJfQAhm4Kb5VrF/sjao
 Ywe8vQZpzLsakQ6TNBTGmgrbIb4F1gutGr2Irst0NvAQsdjpiwOavE1CV74el02e9Rjc
 Xb4w==
X-Gm-Message-State: AOAM533wotBVjkYy2Z0Y7ZtRYwAjIdH+i2xxzgZfRePhceiGUrZdYBoC
 amFf3RxyxJZbLi/YTqPTWzFmza0KTSnxWBNTeRW8pA==
X-Google-Smtp-Source: ABdhPJzAF3flDehB29IfdspG2Sno4itCL5NoR+byK98QzmZJTdgra9B9UfGRgJB9rr7S6NMiiZ4BAaXCt3w6fyJl7bo=
X-Received: by 2002:a05:6e02:1ca4:: with SMTP id
 x4mr3795459ill.58.1614370243782; 
 Fri, 26 Feb 2021 12:10:43 -0800 (PST)
MIME-Version: 1.0
References: <20210218122546.3546582-1-gmouse@google.com>
 <CADKL2t6P4gaSUZEFgk7y+TNBRw0Lhf8mXTxzLdbe3FhGs0WH+w@mail.gmail.com>
 <CAP6Zq1jf4-XAhLQxqNx3LM7-YzDr8zaVPb-jznn8o=frxTotdQ@mail.gmail.com>
In-Reply-To: <CAP6Zq1jf4-XAhLQxqNx3LM7-YzDr8zaVPb-jznn8o=frxTotdQ@mail.gmail.com>
From: Anton Kachalov <gmouse@google.com>
Date: Fri, 26 Feb 2021 21:10:32 +0100
Message-ID: <CADVsX8-4gJYs1P7y4VazyXPNC2TxgmUi1MgOpLgx3iAV9n62Hg@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: nuvoton: Fix flash layout
To: Tomer Maimon <tmaimon77@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000eb1a5905bc42dc5b"
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000eb1a5905bc42dc5b
Content-Type: text/plain; charset="UTF-8"

Hello, Tomer.

Seems like Nuvoton's u-boot expects the uboot-env at different address
comparing to openbmc-flash-layout.dtsi:

https://github.com/Nuvoton-Israel/u-boot/blob/npcm7xx-v2019.01/include/configs/poleg.h#L30

Vs.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/openbmc-flash-layout.dtsi#n13

The change is more about making partitions naming the same as expected by
OpenBMC.

On Sun, 21 Feb 2021 at 17:40, Tomer Maimon <tmaimon77@gmail.com> wrote:

> Hi Benjamin and Anton,
>
> Sorry for the late reply,
>
> The EVB FIU0-CS0 partitioning is used for testing the EVB and this is why
> it is different than the OpenBMC flash layout.
>
>
>
> Are you using the NPCM7XX EVB for OpenBMC? if yes we can consider to
> modify the flash partition to OpenBMC use.
>
> On Thu, 18 Feb 2021 at 19:11, Benjamin Fair <benjaminfair@google.com>
> wrote:
>
>> On Thu, 18 Feb 2021 at 04:42, <gmouse@google.com> wrote:
>> >
>> > From: "Anton D. Kachalov" <gmouse@google.com>
>> >
>> > This change satisfy OpenBMC requirements for flash layout.
>> >
>> > Signed-off-by: Anton D. Kachalov <gmouse@google.com>
>> > ---
>> >  arch/arm/boot/dts/nuvoton-npcm750-evb.dts | 28 +++++++----------------
>> >  1 file changed, 8 insertions(+), 20 deletions(-)
>> >
>> > diff --git a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
>> b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
>> > index bd1eb6ee380f..741c1fee8552 100644
>> > --- a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
>> > +++ b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
>> > @@ -182,8 +182,8 @@ bbuboot2@80000 {
>> >                                 reg = <0x0080000 0x80000>;
>> >                                 read-only;
>> >                                 };
>> > -                       envparam@100000 {
>> > -                               label = "env-param";
>> > +                       ubootenv@100000 {
>> > +                               label = "u-boot-env";
>> >                                 reg = <0x0100000 0x40000>;
>> >                                 read-only;
>> >                                 };
>> > @@ -195,25 +195,13 @@ kernel@200000 {
>> >                                 label = "kernel";
>> >                                 reg = <0x0200000 0x400000>;
>> >                                 };
>> > -                       rootfs@600000 {
>> > -                               label = "rootfs";
>> > -                               reg = <0x0600000 0x700000>;
>> > +                       rofs@780000 {
>> > +                               label = "rofs";
>> > +                               reg = <0x0780000 0x1680000>;
>> >                                 };
>> > -                       spare1@D00000 {
>> > -                               label = "spare1";
>> > -                               reg = <0x0D00000 0x200000>;
>> > -                               };
>> > -                       spare2@0F00000 {
>> > -                               label = "spare2";
>> > -                               reg = <0x0F00000 0x200000>;
>> > -                               };
>> > -                       spare3@1100000 {
>> > -                               label = "spare3";
>> > -                               reg = <0x1100000 0x200000>;
>> > -                               };
>> > -                       spare4@1300000 {
>> > -                               label = "spare4";
>> > -                               reg = <0x1300000 0x0>;
>> > +                       rwfs@1e00000 {
>> > +                               label = "rwfs";
>> > +                               reg = <0x1e00000 0x200000>;
>> >                         };
>>
>> I recommend just including the openbmc-flash-layout.dtsi file here
>> instead since that contains the common flash layout for most OpenBMC
>> systems.
>>
>> Good solution,
> Do you mean nuvoton-openbmc-flash-layout?
>
>> >                 };
>> >         };
>> > --
>> > 2.30.0.478.g8a0d178c01-goog
>> >
>>
>
> Thanks,
>
> Tomer
>

--000000000000eb1a5905bc42dc5b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+SGVsbG8sIFRvbWVyLjxicj48L2Rpdj48ZGl2
IGRpcj0ibHRyIj48ZGl2Pjxicj48L2Rpdj48ZGl2PlNlZW1zIGxpa2UgTnV2b3RvbiYjMzk7c8Kg
dS1ib290IGV4cGVjdHMgdGhlIHVib290LWVudiBhdCBkaWZmZXJlbnQgYWRkcmVzcyBjb21wYXJp
bmcgdG8gb3BlbmJtYy1mbGFzaC1sYXlvdXQuZHRzaTo8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2
PjxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS9OdXZvdG9uLUlzcmFlbC91LWJvb3QvYmxvYi9u
cGNtN3h4LXYyMDE5LjAxL2luY2x1ZGUvY29uZmlncy9wb2xlZy5oI0wzMCI+aHR0cHM6Ly9naXRo
dWIuY29tL051dm90b24tSXNyYWVsL3UtYm9vdC9ibG9iL25wY203eHgtdjIwMTkuMDEvaW5jbHVk
ZS9jb25maWdzL3BvbGVnLmgjTDMwPC9hPjxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PlZz
LjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+PGEgaHJlZj0iaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvYXJjaC9h
cm0vYm9vdC9kdHMvb3BlbmJtYy1mbGFzaC1sYXlvdXQuZHRzaSNuMTMiPmh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVl
L2FyY2gvYXJtL2Jvb3QvZHRzL29wZW5ibWMtZmxhc2gtbGF5b3V0LmR0c2kjbjEzPC9hPjxicj48
L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PlRoZSBjaGFuZ2UgaXMgbW9yZSBhYm91dCBtYWtpbmcg
cGFydGl0aW9ucyBuYW1pbmcgdGhlIHNhbWUgYXMgZXhwZWN0ZWQgYnkgT3BlbkJNQy48L2Rpdj48
ZGl2Pjxicj48L2Rpdj48L2Rpdj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0
ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9uIFN1biwgMjEgRmViIDIwMjEgYXQgMTc6NDAsIFRvbWVy
IE1haW1vbiAmbHQ7PGEgaHJlZj0ibWFpbHRvOnRtYWltb243N0BnbWFpbC5jb20iPnRtYWltb243
N0BnbWFpbC5jb208L2E+Jmd0OyB3cm90ZTo8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9Imdt
YWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFw
eCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPjxkaXYgZGlyPSJsdHIi
PjxkaXYgZGlyPSJsdHIiPkhpwqBCZW5qYW1pbiBhbmQgQW50b24sPGRpdj48YnI+PC9kaXY+PGRp
dj5Tb3JyeSBmb3IgdGhlIGxhdGUgcmVwbHksPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48cCBj
bGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibWFyZ2luOjBjbSAwY20gMC4wMDAxcHQiPjxmb250IGZh
Y2U9ImFyaWFsLCBzYW5zLXNlcmlmIj5UaGUgRVZCIEZJVTAtQ1MwDQpwYXJ0aXRpb25pbmfCoGlz
IHVzZWQgZm9yIHRlc3RpbmfCoHRoZSBFVkIgYW5kIHRoaXMgaXMgd2h5IGl0IGlzDQpkaWZmZXJl
bnTCoHRoYW4gdGhlIE9wZW5CTUMgZmxhc2ggbGF5b3V0LjwvZm9udD48L3A+DQoNCjxwIGNsYXNz
PSJNc29Ob3JtYWwiIHN0eWxlPSJtYXJnaW46MGNtIDBjbSAwLjAwMDFwdCI+PGZvbnQgZmFjZT0i
YXJpYWwsIHNhbnMtc2VyaWYiPsKgPC9mb250PjwvcD4NCg0KPHAgY2xhc3M9Ik1zb05vcm1hbCIg
c3R5bGU9Im1hcmdpbjowY20gMGNtIDAuMDAwMXB0Ij48Zm9udCBmYWNlPSJhcmlhbCwgc2Fucy1z
ZXJpZiI+QXJlIHlvdSB1c2luZyB0aGUgTlBDTTdYWCBFVkIgZm9yDQpPcGVuQk1DPyBpZiB5ZXMg
d2UgY2FuIGNvbnNpZGVyIHRvIG1vZGlmeSB0aGUgZmxhc2ggcGFydGl0aW9uIHRvIE9wZW5CTUMg
dXNlLjwvZm9udD48L3A+PC9kaXY+PGRpdj48YnI+PC9kaXY+PC9kaXY+PGRpdiBjbGFzcz0iZ21h
aWxfcXVvdGUiPjxkaXYgZGlyPSJsdHIiIGNsYXNzPSJnbWFpbF9hdHRyIj5PbiBUaHUsIDE4IEZl
YiAyMDIxIGF0IDE5OjExLCBCZW5qYW1pbiBGYWlyICZsdDs8YSBocmVmPSJtYWlsdG86YmVuamFt
aW5mYWlyQGdvb2dsZS5jb20iIHRhcmdldD0iX2JsYW5rIj5iZW5qYW1pbmZhaXJAZ29vZ2xlLmNv
bTwvYT4mZ3Q7IHdyb3RlOjxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUi
IHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJn
YigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+T24gVGh1LCAxOCBGZWIgMjAyMSBhdCAw
NDo0MiwgJmx0OzxhIGhyZWY9Im1haWx0bzpnbW91c2VAZ29vZ2xlLmNvbSIgdGFyZ2V0PSJfYmxh
bmsiPmdtb3VzZUBnb29nbGUuY29tPC9hPiZndDsgd3JvdGU6PGJyPg0KJmd0Ozxicj4NCiZndDsg
RnJvbTogJnF1b3Q7QW50b24gRC4gS2FjaGFsb3YmcXVvdDsgJmx0OzxhIGhyZWY9Im1haWx0bzpn
bW91c2VAZ29vZ2xlLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmdtb3VzZUBnb29nbGUuY29tPC9hPiZn
dDs8YnI+DQomZ3Q7PGJyPg0KJmd0OyBUaGlzIGNoYW5nZSBzYXRpc2Z5IE9wZW5CTUMgcmVxdWly
ZW1lbnRzIGZvciBmbGFzaCBsYXlvdXQuPGJyPg0KJmd0Ozxicj4NCiZndDsgU2lnbmVkLW9mZi1i
eTogQW50b24gRC4gS2FjaGFsb3YgJmx0OzxhIGhyZWY9Im1haWx0bzpnbW91c2VAZ29vZ2xlLmNv
bSIgdGFyZ2V0PSJfYmxhbmsiPmdtb3VzZUBnb29nbGUuY29tPC9hPiZndDs8YnI+DQomZ3Q7IC0t
LTxicj4NCiZndDvCoCBhcmNoL2FybS9ib290L2R0cy9udXZvdG9uLW5wY203NTAtZXZiLmR0cyB8
IDI4ICsrKysrKystLS0tLS0tLS0tLS0tLS0tPGJyPg0KJmd0O8KgIDEgZmlsZSBjaGFuZ2VkLCA4
IGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKTxicj4NCiZndDs8YnI+DQomZ3Q7IGRpZmYg
LS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9udXZvdG9uLW5wY203NTAtZXZiLmR0cyBiL2FyY2gv
YXJtL2Jvb3QvZHRzL251dm90b24tbnBjbTc1MC1ldmIuZHRzPGJyPg0KJmd0OyBpbmRleCBiZDFl
YjZlZTM4MGYuLjc0MWMxZmVlODU1MiAxMDA2NDQ8YnI+DQomZ3Q7IC0tLSBhL2FyY2gvYXJtL2Jv
b3QvZHRzL251dm90b24tbnBjbTc1MC1ldmIuZHRzPGJyPg0KJmd0OyArKysgYi9hcmNoL2FybS9i
b290L2R0cy9udXZvdG9uLW5wY203NTAtZXZiLmR0czxicj4NCiZndDsgQEAgLTE4Miw4ICsxODIs
OCBAQCBiYnVib290MkA4MDAwMCB7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4MDA4MDAwMCAweDgwMDAwJmd0Ozs8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqByZWFkLW9ubHk7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGVudnBhcmFtQDEwMDAwMCB7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBsYWJlbCA9ICZxdW90O2Vudi1wYXJhbSZxdW90Ozs8
YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHVib290ZW52QDEw
MDAwMCB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBsYWJlbCA9ICZxdW90O3UtYm9vdC1lbnYmcXVvdDs7PGJyPg0KJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4MDEw
MDAwMCAweDQwMDAwJmd0Ozs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqByZWFkLW9ubHk7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7IEBAIC0xOTUsMjUg
KzE5NSwxMyBAQCBrZXJuZWxAMjAwMDAwIHs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBsYWJlbCA9ICZxdW90O2tlcm5lbCZxdW90Ozs8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqByZWcgPSAmbHQ7MHgwMjAwMDAwIDB4NDAwMDAwJmd0Ozs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsgLcKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcm9vdGZzQDYwMDAwMCB7PGJyPg0KJmd0OyAt
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBsYWJlbCA9ICZx
dW90O3Jvb3RmcyZxdW90Ozs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDA2MDAwMDAgMHg3MDAwMDAmZ3Q7Ozxicj4N
CiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcm9mc0A3ODAwMDAgezxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
bGFiZWwgPSAmcXVvdDtyb2ZzJnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4MDc4MDAwMCAweDE2ODAwMDAm
Z3Q7Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoH07PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBz
cGFyZTFARDAwMDAwIHs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGxhYmVsID0gJnF1b3Q7c3BhcmUxJnF1b3Q7Ozxicj4NCiZndDsgLcKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4
MEQwMDAwMCAweDIwMDAwMCZndDs7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgc3BhcmUyQDBGMDAwMDAgezxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbGFiZWwgPSAmcXVvdDtzcGFyZTImcXVv
dDs7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqByZWcgPSAmbHQ7MHgwRjAwMDAwIDB4MjAwMDAwJmd0Ozs8YnI+DQomZ3Q7IC3CoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyAtwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzcGFyZTNAMTEwMDAwMCB7PGJyPg0KJmd0
OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBsYWJlbCA9
ICZxdW90O3NwYXJlMyZxdW90Ozs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDExMDAwMDAgMHgyMDAwMDAmZ3Q7Ozxi
cj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
fTs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHNwYXJlNEAx
MzAwMDAwIHs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGxhYmVsID0gJnF1b3Q7c3BhcmU0JnF1b3Q7Ozxicj4NCiZndDsgLcKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4MTMwMDAw
MCAweDAmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
cndmc0AxZTAwMDAwIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGxhYmVsID0gJnF1b3Q7cndmcyZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDFl
MDAwMDAgMHgyMDAwMDAmZ3Q7Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoH07PGJyPg0KPGJyPg0KSSByZWNvbW1lbmQganVzdCBpbmNsdWRpbmcgdGhlIG9w
ZW5ibWMtZmxhc2gtbGF5b3V0LmR0c2kgZmlsZSBoZXJlPGJyPg0KaW5zdGVhZCBzaW5jZSB0aGF0
IGNvbnRhaW5zIHRoZSBjb21tb24gZmxhc2ggbGF5b3V0IGZvciBtb3N0IE9wZW5CTUM8YnI+DQpz
eXN0ZW1zLjxicj4NCjxicj48L2Jsb2NrcXVvdGU+PGRpdj5Hb29kwqA8Zm9udCBmYWNlPSJhcmlh
bCwgc2Fucy1zZXJpZiI+c29sdXRpb248L2ZvbnQ+LMKgPC9kaXY+PGRpdj5EbyB5b3UgbWVhbiBu
dXZvdG9uLW9wZW5ibWMtZmxhc2gtbGF5b3V0PzwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFp
bF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHgg
c29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij4NCiZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7IC0t
PGJyPg0KJmd0OyAyLjMwLjAuNDc4Lmc4YTBkMTc4YzAxLWdvb2c8YnI+DQomZ3Q7PGJyPjwvYmxv
Y2txdW90ZT48ZGl2Pjxicj48L2Rpdj48ZGl2PlRoYW5rcyw8L2Rpdj48ZGl2Pjxicj48L2Rpdj48
ZGl2PlRvbWVywqA8L2Rpdj48L2Rpdj48L2Rpdj4NCjwvYmxvY2txdW90ZT48L2Rpdj48L2Rpdj4N
Cg==
--000000000000eb1a5905bc42dc5b--
