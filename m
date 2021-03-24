Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4F3347207
	for <lists+openbmc@lfdr.de>; Wed, 24 Mar 2021 08:07:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4zp05FMBz3022
	for <lists+openbmc@lfdr.de>; Wed, 24 Mar 2021 18:07:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=gmQ6qNBe;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::12d;
 helo=mail-il1-x12d.google.com; envelope-from=gmouse@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=gmQ6qNBe; dkim-atps=neutral
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4znm11QKz3022
 for <openbmc@lists.ozlabs.org>; Wed, 24 Mar 2021 18:07:21 +1100 (AEDT)
Received: by mail-il1-x12d.google.com with SMTP id j11so20462283ilu.13
 for <openbmc@lists.ozlabs.org>; Wed, 24 Mar 2021 00:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qI8+Vulo2EKpYq/OYNezAgXZf+iTLFrnNVnbFK3dIn0=;
 b=gmQ6qNBe2t+dT8C/IuG2BmZuUqXVd89QKDudwn5ZzNiZ4DpPeS2gTuIS55TSoxr9J5
 UyJr5Pr+gCkg02OpD4pizFRbocbHU/4XJAIHrBLcezi8rOvwqL/qrh+MoyyRsfECuWMe
 8DPe5EZcmk2QofXY8vDJYTTGf0CUaYG4/v856hQhkcW48IaG74f+Cge3lW3pwjGMnoCe
 2piFfLuZ+8pEr3nfXF8zmAMELZmXyQzpVSN9JcqAwNMkLjRGEoQgbMYgh7nwouHdhOAc
 Ld+MFpODaBvOxSjkq5pJ+f/YOWmDMA0fuqOCDWVbzpcsVxPC210tUatb5Aga9tgv0Isj
 oDIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qI8+Vulo2EKpYq/OYNezAgXZf+iTLFrnNVnbFK3dIn0=;
 b=DgFGPEcd+rh0CFZXvsli21zMu/7F0gdT+gprj4cVvBRSzJHdFdpk0NkVDuzTq9rz0U
 zKQuqVhqz6ZZj296pvB/joTBAINoKqhV/eABwVZ/9KpZTjooaBcpYYChnS+LpKHTJTBp
 kfBMt2xXYFYiFVU+nImRbZBee44+4i7l4suDBozK/dd6qBXL7/AIVw7mEznugx8sVUK1
 jkZR7H3fuSUvrfl9A0Wg8zCfwCVSebbV8+pbGMx31dKY7X7yqYB0i0uzZlCV5XrAmggi
 zg2C9FYgqhMIg/Vte1Zjc/Sj+xzybWS444s+s6wRsRc1UE9wFROU5a1R75BjCFMoelmA
 bf4Q==
X-Gm-Message-State: AOAM530DPAt/sHCzojcP9fK3EjHwghEetSgFYIhNV37/rmEzsKaARMvQ
 bQM8O2+ZfzX6YHiGuK0BMUw07nPtW9yEPoXAPdgq8g==
X-Google-Smtp-Source: ABdhPJy6R0dDialPa+D6JruieV+DuvZckANllwcydG1tzYQ2+AhlVe4dzyX4coOjDF9u0U4Uzm+cUqBxHW9PWwu4Xr4=
X-Received: by 2002:a92:d604:: with SMTP id w4mr1552067ilm.11.1616569637562;
 Wed, 24 Mar 2021 00:07:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210308171049.3962577-1-gmouse@google.com>
In-Reply-To: <20210308171049.3962577-1-gmouse@google.com>
From: Anton Kachalov <gmouse@google.com>
Date: Wed, 24 Mar 2021 08:07:06 +0100
Message-ID: <CADVsX8-Vy=t9Y1VYqY9kLY-4EjsaUN2fNABw6JzM8noXB+SBvA@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: nuvoton: Fix flash layout
To: Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Rob Herring <robh+dt@kernel.org>
Content-Type: multipart/alternative; boundary="00000000000001000005be42f398"
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
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000001000005be42f398
Content-Type: text/plain; charset="UTF-8"

Gently ping

On Mon, 8 Mar 2021 at 18:11, <gmouse@google.com> wrote:

> From: "Anton D. Kachalov" <gmouse@google.com>
>
> This change follows OpenBMC partitions' naming layout.
>
> Signed-off-by: Anton D. Kachalov <gmouse@google.com>
> ---
>  arch/arm/boot/dts/nuvoton-npcm750-evb.dts | 38 +++++++----------------
>  1 file changed, 11 insertions(+), 27 deletions(-)
>
> diff --git a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> index 9f13d08f5804..55c5a89592d7 100644
> --- a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> +++ b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> @@ -78,8 +78,8 @@ partitions@80000000 {
>                         compatible = "fixed-partitions";
>                         #address-cells = <1>;
>                         #size-cells = <1>;
> -                       bbuboot1@0 {
> -                               label = "bb-uboot-1";
> +                       u-boot@0 {
> +                               label = "u-boot";
>                                 reg = <0x0000000 0x80000>;
>                                 read-only;
>                                 };
> @@ -88,38 +88,22 @@ bbuboot2@80000 {
>                                 reg = <0x0080000 0x80000>;
>                                 read-only;
>                                 };
> -                       envparam@100000 {
> -                               label = "env-param";
> +                       u-boot-env@100000 {
> +                               label = "u-boot-env";
>                                 reg = <0x0100000 0x40000>;
>                                 read-only;
>                                 };
> -                       spare@140000 {
> -                               label = "spare";
> -                               reg = <0x0140000 0xC0000>;
> -                               };
>                         kernel@200000 {
>                                 label = "kernel";
> -                               reg = <0x0200000 0x400000>;
> -                               };
> -                       rootfs@600000 {
> -                               label = "rootfs";
> -                               reg = <0x0600000 0x700000>;
> -                               };
> -                       spare1@D00000 {
> -                               label = "spare1";
> -                               reg = <0x0D00000 0x200000>;
> -                               };
> -                       spare2@0F00000 {
> -                               label = "spare2";
> -                               reg = <0x0F00000 0x200000>;
> +                               reg = <0x0200000 0x580000>;
>                                 };
> -                       spare3@1100000 {
> -                               label = "spare3";
> -                               reg = <0x1100000 0x200000>;
> +                       rofs@780000 {
> +                               label = "rofs";
> +                               reg = <0x0780000 0x1680000>;
>                                 };
> -                       spare4@1300000 {
> -                               label = "spare4";
> -                               reg = <0x1300000 0x0>;
> +                       rwfs@1e00000 {
> +                               label = "rwfs";
> +                               reg = <0x1e00000 0x200000>;
>                         };
>                 };
>         };
> --
> 2.30.1.766.gb4fecdf3b7-goog
>
>

--00000000000001000005be42f398
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+R2VudGx5IHBpbmc8L2Rpdj48YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVv
dGUiPjxkaXYgZGlyPSJsdHIiIGNsYXNzPSJnbWFpbF9hdHRyIj5PbiBNb24sIDggTWFyIDIwMjEg
YXQgMTg6MTEsICZsdDs8YSBocmVmPSJtYWlsdG86Z21vdXNlQGdvb2dsZS5jb20iPmdtb3VzZUBn
b29nbGUuY29tPC9hPiZndDsgd3JvdGU6PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFp
bF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHgg
c29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij5Gcm9tOiAmcXVvdDtBbnRv
biBELiBLYWNoYWxvdiZxdW90OyAmbHQ7PGEgaHJlZj0ibWFpbHRvOmdtb3VzZUBnb29nbGUuY29t
IiB0YXJnZXQ9Il9ibGFuayI+Z21vdXNlQGdvb2dsZS5jb208L2E+Jmd0Ozxicj4NCjxicj4NClRo
aXMgY2hhbmdlIGZvbGxvd3MgT3BlbkJNQyBwYXJ0aXRpb25zJiMzOTsgbmFtaW5nIGxheW91dC48
YnI+DQo8YnI+DQpTaWduZWQtb2ZmLWJ5OiBBbnRvbiBELiBLYWNoYWxvdiAmbHQ7PGEgaHJlZj0i
bWFpbHRvOmdtb3VzZUBnb29nbGUuY29tIiB0YXJnZXQ9Il9ibGFuayI+Z21vdXNlQGdvb2dsZS5j
b208L2E+Jmd0Ozxicj4NCi0tLTxicj4NCsKgYXJjaC9hcm0vYm9vdC9kdHMvbnV2b3Rvbi1ucGNt
NzUwLWV2Yi5kdHMgfCAzOCArKysrKysrLS0tLS0tLS0tLS0tLS0tLTxicj4NCsKgMSBmaWxlIGNo
YW5nZWQsIDExIGluc2VydGlvbnMoKyksIDI3IGRlbGV0aW9ucygtKTxicj4NCjxicj4NCmRpZmYg
LS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9udXZvdG9uLW5wY203NTAtZXZiLmR0cyBiL2FyY2gv
YXJtL2Jvb3QvZHRzL251dm90b24tbnBjbTc1MC1ldmIuZHRzPGJyPg0KaW5kZXggOWYxM2QwOGY1
ODA0Li41NWM1YTg5NTkyZDcgMTAwNjQ0PGJyPg0KLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvbnV2
b3Rvbi1ucGNtNzUwLWV2Yi5kdHM8YnI+DQorKysgYi9hcmNoL2FybS9ib290L2R0cy9udXZvdG9u
LW5wY203NTAtZXZiLmR0czxicj4NCkBAIC03OCw4ICs3OCw4IEBAIHBhcnRpdGlvbnNAODAwMDAw
MDAgezxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGNvbXBhdGlibGUg
PSAmcXVvdDtmaXhlZC1wYXJ0aXRpb25zJnF1b3Q7Ozxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgICNhZGRyZXNzLWNlbGxzID0gJmx0OzEmZ3Q7Ozxicj4NCsKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICNzaXplLWNlbGxzID0gJmx0OzEmZ3Q7Ozxicj4N
Ci3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJidWJvb3QxQDAgezxicj4NCi3C
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGxhYmVsID0gJnF1
b3Q7YmItdWJvb3QtMSZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqB1LWJvb3RAMCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgbGFiZWwgPSAmcXVvdDt1LWJvb3QmcXVvdDs7PGJyPg0KwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVnID0gJmx0OzB4MDAwMDAwMCAw
eDgwMDAwJmd0Ozs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCByZWFkLW9ubHk7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgfTs8YnI+DQpAQCAtODgsMzggKzg4LDIyIEBAIGJidWJvb3QyQDgwMDAw
IHs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBy
ZWcgPSAmbHQ7MHgwMDgwMDAwIDB4ODAwMDAmZ3Q7Ozxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJlYWQtb25seTs8YnI+DQrCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB9Ozxicj4NCi3CoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGVudnBhcmFtQDEwMDAwMCB7PGJyPg0KLcKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbGFiZWwgPSAmcXVvdDtlbnYtcGFy
YW0mcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdS1ib290
LWVudkAxMDAwMDAgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGxhYmVsID0gJnF1b3Q7dS1ib290LWVudiZxdW90Ozs8YnI+DQrCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCByZWcgPSAmbHQ7MHgwMTAwMDAw
IDB4NDAwMDAmZ3Q7Ozxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIHJlYWQtb25seTs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCB9Ozxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHNwYXJlQDE0MDAwMCB7PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgbGFiZWwgPSAmcXVvdDtzcGFyZSZxdW90Ozs8YnI+DQotwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgwMTQwMDAw
IDB4QzAwMDAmZ3Q7Ozxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoH07PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAga2Vy
bmVsQDIwMDAwMCB7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgbGFiZWwgPSAmcXVvdDtrZXJuZWwmcXVvdDs7PGJyPg0KLcKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4MDIwMDAwMCAweDQw
MDAwMCZndDs7PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgfTs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByb290ZnNA
NjAwMDAwIHs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBsYWJlbCA9ICZxdW90O3Jvb3RmcyZxdW90Ozs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgwNjAwMDAwIDB4NzAwMDAw
Jmd0Ozs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqB9Ozxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHNwYXJlMUBEMDAw
MDAgezxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGxhYmVsID0gJnF1b3Q7c3BhcmUxJnF1b3Q7Ozxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDBEMDAwMDAgMHgyMDAwMDAmZ3Q7
Ozxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07
PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3BhcmUyQDBGMDAwMDAg
ezxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGxh
YmVsID0gJnF1b3Q7c3BhcmUyJnF1b3Q7Ozxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDBGMDAwMDAgMHgyMDAwMDAmZ3Q7Ozxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9
ICZsdDsweDAyMDAwMDAgMHg1ODAwMDAmZ3Q7Ozxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH07PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgc3BhcmUzQDExMDAwMDAgezxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGxhYmVsID0gJnF1b3Q7c3BhcmUzJnF1b3Q7Ozxicj4N
Ci3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZs
dDsweDExMDAwMDAgMHgyMDAwMDAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHJvZnNANzgwMDAwIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBsYWJlbCA9ICZxdW90O3JvZnMmcXVvdDs7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4MDc4
MDAwMCAweDE2ODAwMDAmZ3Q7Ozxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIH07PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgc3BhcmU0QDEzMDAwMDAgezxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGxhYmVsID0gJnF1b3Q7c3BhcmU0JnF1b3Q7Ozxicj4NCi3CoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDEzMDAw
MDAgMHgwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByd2Zz
QDFlMDAwMDAgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGxhYmVsID0gJnF1b3Q7cndmcyZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgxZTAwMDAwIDB4MjAwMDAw
Jmd0Ozs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB9Ozxicj4NCsKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIH07PGJyPg0KwqAgwqAgwqAgwqAgfTs8YnI+DQotLSA8YnI+
DQoyLjMwLjEuNzY2LmdiNGZlY2RmM2I3LWdvb2c8YnI+DQo8YnI+DQo8L2Jsb2NrcXVvdGU+PC9k
aXY+DQo=
--00000000000001000005be42f398--
