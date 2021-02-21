Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F04320BCC
	for <lists+openbmc@lfdr.de>; Sun, 21 Feb 2021 17:40:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dk9zL6lVwz3cHM
	for <lists+openbmc@lfdr.de>; Mon, 22 Feb 2021 03:40:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=s0swC0No;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32b;
 helo=mail-ot1-x32b.google.com; envelope-from=tmaimon77@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=s0swC0No; dkim-atps=neutral
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dk9z620lSz30J9
 for <openbmc@lists.ozlabs.org>; Mon, 22 Feb 2021 03:40:15 +1100 (AEDT)
Received: by mail-ot1-x32b.google.com with SMTP id l16so852579oti.12
 for <openbmc@lists.ozlabs.org>; Sun, 21 Feb 2021 08:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Jmr0JadNwnnMMTw2qAsaVLMx2jU4y4gMqGCc96wUNjc=;
 b=s0swC0NoRWy8r5Cw6hTV7WQImuY0AZFZqHNWQNw8404egjTiK/nuomcKPH7B3IzXOW
 fOW16pq40erciEBnB9nEXnLNlsG9QzXwo+eN5KOo2MQ562PIYbyJdBEye3RA4n0hKAGu
 Mzty+G0T3Cbnpp3nk1pmJAddFVYzpRmvO/KL2ivjuEDiGxN7NAwOuyMgNKcXAQ5WS0vH
 /ZxU3wZOFWg+fVSD1poTtvpRaCR7F3xJOq/o6smCCcIMPyXTwu33qWsv7vHnEn06BLcb
 9QGToX/yGMuzT59qRHDejyX6xDxdvri7zgVDg1IcrVm3htfORx7uE7GnKTXdLplb35s+
 NTDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Jmr0JadNwnnMMTw2qAsaVLMx2jU4y4gMqGCc96wUNjc=;
 b=LWnzVQ/ZEpJ7g+oPm5uCKAtJXieHDKW7//9SeFBDJCshOxq5c91L2agffINNYPH/MI
 wibZHt+C6XkqDByo9gwA4itNEsxosRKyI/Tr4PVKEaTVN696ZHqPx7u2DaNHHOrDvR8U
 WH7wssoP3ZxxI7mic8UJxmIevOhIFLhKJQRSypnkmY5TUnF9w3F6hI9V+7emM8vGnT+z
 BuVeszKGcpMI4pC86VZZ8lFXusQ/3l9w0iw8UsMqXptmA+vq1lNQodCqWTq3LLCv9LGe
 qe7jrcxzXbDRDkKhLsgQppYt1ZubE0mwEG30YKg0LlfkOjloXpTtkGUX9vXsvVZPE65d
 vMGA==
X-Gm-Message-State: AOAM532mKT9vIE12OFBx/UNjE+/0wL8sVzM5AKaojWnpAFOLO7fl2niL
 ZbLZ78k68JnIJxD+I1yY9TuZQx+c5k68IecrJVM=
X-Google-Smtp-Source: ABdhPJyxKRUCzknig6XcEeR/yivqew3fbmoXvuXBZqFPItlrEzXIs7hP8nAZBt8S3jdx6ndbiiYyzwd4gOHf/7HO/vQ=
X-Received: by 2002:a9d:22a5:: with SMTP id y34mr10234853ota.321.1613925611368; 
 Sun, 21 Feb 2021 08:40:11 -0800 (PST)
MIME-Version: 1.0
References: <20210218122546.3546582-1-gmouse@google.com>
 <CADKL2t6P4gaSUZEFgk7y+TNBRw0Lhf8mXTxzLdbe3FhGs0WH+w@mail.gmail.com>
In-Reply-To: <CADKL2t6P4gaSUZEFgk7y+TNBRw0Lhf8mXTxzLdbe3FhGs0WH+w@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Sun, 21 Feb 2021 18:53:41 +0200
Message-ID: <CAP6Zq1jf4-XAhLQxqNx3LM7-YzDr8zaVPb-jznn8o=frxTotdQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: nuvoton: Fix flash layout
To: Benjamin Fair <benjaminfair@google.com>
Content-Type: multipart/alternative; boundary="000000000000c273fa05bbdb564e"
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
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Anton Kachalov <gmouse@google.com>, Tali Perry <tali.perry1@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000c273fa05bbdb564e
Content-Type: text/plain; charset="UTF-8"

Hi Benjamin and Anton,

Sorry for the late reply,

The EVB FIU0-CS0 partitioning is used for testing the EVB and this is why
it is different than the OpenBMC flash layout.



Are you using the NPCM7XX EVB for OpenBMC? if yes we can consider to modify
the flash partition to OpenBMC use.

On Thu, 18 Feb 2021 at 19:11, Benjamin Fair <benjaminfair@google.com> wrote:

> On Thu, 18 Feb 2021 at 04:42, <gmouse@google.com> wrote:
> >
> > From: "Anton D. Kachalov" <gmouse@google.com>
> >
> > This change satisfy OpenBMC requirements for flash layout.
> >
> > Signed-off-by: Anton D. Kachalov <gmouse@google.com>
> > ---
> >  arch/arm/boot/dts/nuvoton-npcm750-evb.dts | 28 +++++++----------------
> >  1 file changed, 8 insertions(+), 20 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> > index bd1eb6ee380f..741c1fee8552 100644
> > --- a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> > +++ b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> > @@ -182,8 +182,8 @@ bbuboot2@80000 {
> >                                 reg = <0x0080000 0x80000>;
> >                                 read-only;
> >                                 };
> > -                       envparam@100000 {
> > -                               label = "env-param";
> > +                       ubootenv@100000 {
> > +                               label = "u-boot-env";
> >                                 reg = <0x0100000 0x40000>;
> >                                 read-only;
> >                                 };
> > @@ -195,25 +195,13 @@ kernel@200000 {
> >                                 label = "kernel";
> >                                 reg = <0x0200000 0x400000>;
> >                                 };
> > -                       rootfs@600000 {
> > -                               label = "rootfs";
> > -                               reg = <0x0600000 0x700000>;
> > +                       rofs@780000 {
> > +                               label = "rofs";
> > +                               reg = <0x0780000 0x1680000>;
> >                                 };
> > -                       spare1@D00000 {
> > -                               label = "spare1";
> > -                               reg = <0x0D00000 0x200000>;
> > -                               };
> > -                       spare2@0F00000 {
> > -                               label = "spare2";
> > -                               reg = <0x0F00000 0x200000>;
> > -                               };
> > -                       spare3@1100000 {
> > -                               label = "spare3";
> > -                               reg = <0x1100000 0x200000>;
> > -                               };
> > -                       spare4@1300000 {
> > -                               label = "spare4";
> > -                               reg = <0x1300000 0x0>;
> > +                       rwfs@1e00000 {
> > +                               label = "rwfs";
> > +                               reg = <0x1e00000 0x200000>;
> >                         };
>
> I recommend just including the openbmc-flash-layout.dtsi file here
> instead since that contains the common flash layout for most OpenBMC
> systems.
>
> Good solution,
Do you mean nuvoton-openbmc-flash-layout?

> >                 };
> >         };
> > --
> > 2.30.0.478.g8a0d178c01-goog
> >
>

Thanks,

Tomer

--000000000000c273fa05bbdb564e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+SGnCoEJlbmphbWluIGFuZCBBbnRvbiw8ZGl2
Pjxicj48L2Rpdj48ZGl2PlNvcnJ5IGZvciB0aGUgbGF0ZSByZXBseSw8L2Rpdj48ZGl2Pjxicj48
L2Rpdj48ZGl2PjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtYXJnaW46MGNtIDBjbSAwLjAw
MDFwdCI+PGZvbnQgZmFjZT0iYXJpYWwsIHNhbnMtc2VyaWYiIHN0eWxlPSIiPlRoZSBFVkIgRklV
MC1DUzANCnBhcnRpdGlvbmluZ8KgaXMgdXNlZCBmb3IgdGVzdGluZ8KgdGhlIEVWQiBhbmQgdGhp
cyBpcyB3aHkgaXQgaXMNCmRpZmZlcmVudMKgdGhhbiB0aGUgT3BlbkJNQyBmbGFzaCBsYXlvdXQu
PC9mb250PjwvcD4NCg0KPHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1hcmdpbjowY20gMGNt
IDAuMDAwMXB0Ij48Zm9udCBmYWNlPSJhcmlhbCwgc2Fucy1zZXJpZiI+wqA8L2ZvbnQ+PC9wPg0K
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibWFyZ2luOjBjbSAwY20gMC4wMDAxcHQiPjxm
b250IGZhY2U9ImFyaWFsLCBzYW5zLXNlcmlmIiBzdHlsZT0iIj5BcmUgeW91IHVzaW5nIHRoZSBO
UENNN1hYIEVWQiBmb3INCk9wZW5CTUM/IGlmIHllcyB3ZSBjYW4gY29uc2lkZXIgdG8gbW9kaWZ5
IHRoZSBmbGFzaCBwYXJ0aXRpb24gdG8gT3BlbkJNQyB1c2UuPC9mb250PjwvcD48L2Rpdj48ZGl2
Pjxicj48L2Rpdj48L2Rpdj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIg
Y2xhc3M9ImdtYWlsX2F0dHIiPk9uIFRodSwgMTggRmViIDIwMjEgYXQgMTk6MTEsIEJlbmphbWlu
IEZhaXIgJmx0OzxhIGhyZWY9Im1haWx0bzpiZW5qYW1pbmZhaXJAZ29vZ2xlLmNvbSI+YmVuamFt
aW5mYWlyQGdvb2dsZS5jb208L2E+Jmd0OyB3cm90ZTo8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xh
c3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1s
ZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPk9uIFRodSwg
MTggRmViIDIwMjEgYXQgMDQ6NDIsICZsdDs8YSBocmVmPSJtYWlsdG86Z21vdXNlQGdvb2dsZS5j
b20iIHRhcmdldD0iX2JsYW5rIj5nbW91c2VAZ29vZ2xlLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj4N
CiZndDs8YnI+DQomZ3Q7IEZyb206ICZxdW90O0FudG9uIEQuIEthY2hhbG92JnF1b3Q7ICZsdDs8
YSBocmVmPSJtYWlsdG86Z21vdXNlQGdvb2dsZS5jb20iIHRhcmdldD0iX2JsYW5rIj5nbW91c2VA
Z29vZ2xlLmNvbTwvYT4mZ3Q7PGJyPg0KJmd0Ozxicj4NCiZndDsgVGhpcyBjaGFuZ2Ugc2F0aXNm
eSBPcGVuQk1DIHJlcXVpcmVtZW50cyBmb3IgZmxhc2ggbGF5b3V0Ljxicj4NCiZndDs8YnI+DQom
Z3Q7IFNpZ25lZC1vZmYtYnk6IEFudG9uIEQuIEthY2hhbG92ICZsdDs8YSBocmVmPSJtYWlsdG86
Z21vdXNlQGdvb2dsZS5jb20iIHRhcmdldD0iX2JsYW5rIj5nbW91c2VAZ29vZ2xlLmNvbTwvYT4m
Z3Q7PGJyPg0KJmd0OyAtLS08YnI+DQomZ3Q7wqAgYXJjaC9hcm0vYm9vdC9kdHMvbnV2b3Rvbi1u
cGNtNzUwLWV2Yi5kdHMgfCAyOCArKysrKysrLS0tLS0tLS0tLS0tLS0tLTxicj4NCiZndDvCoCAx
IGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAyMCBkZWxldGlvbnMoLSk8YnI+DQomZ3Q7
PGJyPg0KJmd0OyBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvbnV2b3Rvbi1ucGNtNzUw
LWV2Yi5kdHMgYi9hcmNoL2FybS9ib290L2R0cy9udXZvdG9uLW5wY203NTAtZXZiLmR0czxicj4N
CiZndDsgaW5kZXggYmQxZWI2ZWUzODBmLi43NDFjMWZlZTg1NTIgMTAwNjQ0PGJyPg0KJmd0OyAt
LS0gYS9hcmNoL2FybS9ib290L2R0cy9udXZvdG9uLW5wY203NTAtZXZiLmR0czxicj4NCiZndDsg
KysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvbnV2b3Rvbi1ucGNtNzUwLWV2Yi5kdHM8YnI+DQomZ3Q7
IEBAIC0xODIsOCArMTgyLDggQEAgYmJ1Ym9vdDJAODAwMDAgezxicj4NCiZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDAwODAw
MDAgMHg4MDAwMCZndDs7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgcmVhZC1vbmx5Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBlbnZwYXJhbUAxMDAwMDAgezxicj4NCiZndDsgLcKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbGFiZWwgPSAmcXVvdDtl
bnYtcGFyYW0mcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqB1Ym9vdGVudkAxMDAwMDAgezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbGFiZWwgPSAmcXVvdDt1LWJvb3QtZW52JnF1b3Q7Ozxi
cj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHJlZyA9ICZsdDsweDAxMDAwMDAgMHg0MDAwMCZndDs7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVhZC1vbmx5Ozxicj4NCiZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0K
Jmd0OyBAQCAtMTk1LDI1ICsxOTUsMTMgQEAga2VybmVsQDIwMDAwMCB7PGJyPg0KJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbGFiZWwgPSAmcXVv
dDtrZXJuZWwmcXVvdDs7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4MDIwMDAwMCAweDQwMDAwMCZndDs7PGJyPg0K
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8
YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJvb3Rmc0A2MDAw
MDAgezxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgbGFiZWwgPSAmcXVvdDtyb290ZnMmcXVvdDs7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgwNjAwMDAwIDB4
NzAwMDAwJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHJvZnNANzgwMDAwIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGxhYmVsID0gJnF1b3Q7cm9mcyZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDA3
ODAwMDAgMHgxNjgwMDAwJmd0Ozs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgc3BhcmUxQEQwMDAwMCB7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBsYWJlbCA9ICZxdW90O3NwYXJlMSZxdW90
Ozs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHJlZyA9ICZsdDsweDBEMDAwMDAgMHgyMDAwMDAmZ3Q7Ozxicj4NCiZndDsgLcKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7IC3CoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHNwYXJlMkAwRjAwMDAwIHs8YnI+DQomZ3Q7
IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGxhYmVsID0g
JnF1b3Q7c3BhcmUyJnF1b3Q7Ozxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4MEYwMDAwMCAweDIwMDAwMCZndDs7PGJy
Pg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9
Ozxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3BhcmUzQDEx
MDAwMDAgezxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgbGFiZWwgPSAmcXVvdDtzcGFyZTMmcXVvdDs7PGJyPg0KJmd0OyAtwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgxMTAwMDAw
IDB4MjAwMDAwJmd0Ozs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBzcGFyZTRAMTMwMDAwMCB7PGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBsYWJlbCA9ICZxdW90O3NwYXJlNCZxdW90Ozs8YnI+
DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJl
ZyA9ICZsdDsweDEzMDAwMDAgMHgwJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHJ3ZnNAMWUwMDAwMCB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBsYWJlbCA9ICZxdW90O3J3ZnMmcXVvdDs7
PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqByZWcgPSAmbHQ7MHgxZTAwMDAwIDB4MjAwMDAwJmd0Ozs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCjxicj4NCkkgcmVjb21tZW5kIGp1c3Qg
aW5jbHVkaW5nIHRoZSBvcGVuYm1jLWZsYXNoLWxheW91dC5kdHNpIGZpbGUgaGVyZTxicj4NCmlu
c3RlYWQgc2luY2UgdGhhdCBjb250YWlucyB0aGUgY29tbW9uIGZsYXNoIGxheW91dCBmb3IgbW9z
dCBPcGVuQk1DPGJyPg0Kc3lzdGVtcy48YnI+DQo8YnI+PC9ibG9ja3F1b3RlPjxkaXY+R29vZMKg
PGZvbnQgZmFjZT0iYXJpYWwsIHNhbnMtc2VyaWYiIHN0eWxlPSIiPnNvbHV0aW9uPC9mb250PizC
oDwvZGl2PjxkaXY+RG8geW91IG1lYW4gbnV2b3Rvbi1vcGVuYm1jLWZsYXNoLWxheW91dD88L2Rp
dj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAw
cHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1s
ZWZ0OjFleCI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDvCoCDC
oCDCoCDCoCDCoH07PGJyPg0KJmd0OyAtLTxicj4NCiZndDsgMi4zMC4wLjQ3OC5nOGEwZDE3OGMw
MS1nb29nPGJyPg0KJmd0Ozxicj48L2Jsb2NrcXVvdGU+PGRpdj48YnI+PC9kaXY+PGRpdj5UaGFu
a3MsPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5Ub21lcsKgPC9kaXY+PC9kaXY+PC9kaXY+DQo=
--000000000000c273fa05bbdb564e--
