Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 856D413780F
	for <lists+openbmc@lfdr.de>; Fri, 10 Jan 2020 21:41:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47vZdP5dMKzDqjg
	for <lists+openbmc@lfdr.de>; Sat, 11 Jan 2020 07:41:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d42;
 helo=mail-io1-xd42.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pJFjRS25; dkim-atps=neutral
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47vZcf0mdrzDqhN
 for <openbmc@lists.ozlabs.org>; Sat, 11 Jan 2020 07:40:33 +1100 (AEDT)
Received: by mail-io1-xd42.google.com with SMTP id c16so3482093ioo.8
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jan 2020 12:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=msjYurKiWbdjJq1h2YgPPDLhli0M7k2d/wSJ65uYcas=;
 b=pJFjRS256hvjKzeQzgGNbPGGhzCO4oCRSRqFHYS9SBHmJqAMWvnqIOts1lVfObFLyM
 eAEcZM0Nw9AiBDEVfeoe1WC/0+1uqALNZ52m6GQlmrSAVEfTeK6/J8+IU9/EFgUrNNbc
 QiCqnXrlcv0Tk+RzedZGs5Kuvh2BSnk3ao3UKgs0d9AOo9lmZ6fITaRyvKH6eK3GxGLK
 JBQOvmrp/jQZG3g/nuNWSRYWgIPbe5L8vw2+C/Ff2MI3jhWg494ohB/BKD66rQWYm7tL
 M8T1U5PWyYmXrgcjntNvLh75vptPt4bzIf5Qh2K31sW2bKyyKZB5elyfOQURVce02XBF
 Ypig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=msjYurKiWbdjJq1h2YgPPDLhli0M7k2d/wSJ65uYcas=;
 b=mrVbHQXDlrLSjTqUuALfiHJ4CEvqWlowIlamRKsqYQEeyX0JNJzqp80AiQuITNxU8W
 Y8kn4bOzQjHvmSJUmIKQTXoe0Vm98bFH4vDW5//OgKZGpaXGcPJ6jZy7WP7LLAF7GTxd
 4dR2fGjreG8xfMcmyGNI/5UsRv8ebUzvEqamlAzfytkUx0mfmKc4WvDKSbIGpA7NhI/X
 JYo9VUZ5ZVv+X5LOnO5LLsYc/zJYQzkXshZoSE95Va2a2K/TGgMHgTCjydMW7E2Lk0e9
 fFggC4Nh8LL9gWa5jr6308BJJxRuesD4KOZUB7iJytDKPM2Y3M4YXM3PWvTgOSF92IUa
 fxzw==
X-Gm-Message-State: APjAAAVHVfQoTPJdE4m8lzgajL1yMQnUrB4fGbhaahvheyJfkJGo0RFg
 3HlWooDIT+7PLKw7oA58Ica6RwvJ
X-Google-Smtp-Source: APXvYqzLlF+udnhrldD1fdv1gidNvqHC5lVQlvhJe9PG/fmd8hLBBpT+KgWghqMyZnQDsKTY48r17Q==
X-Received: by 2002:a5d:8901:: with SMTP id b1mr3915837ion.246.1578688829825; 
 Fri, 10 Jan 2020 12:40:29 -0800 (PST)
Received: from andrews-mbp-2.austin.ibm.com ([129.41.86.0])
 by smtp.gmail.com with ESMTPSA id i136sm994440ild.23.2020.01.10.12.40.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 10 Jan 2020 12:40:29 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.40.2.2.4\))
Subject: Re: [PATCH linux dev-5.4] ARM: dts: aspeed: rainier: Add second cfam
 on the hub
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <20200109200839.11936-1-eajames@linux.ibm.com>
Date: Fri, 10 Jan 2020 14:40:28 -0600
Content-Transfer-Encoding: quoted-printable
Message-Id: <05187825-BD49-4186-8AD8-B106AC9A3D7C@gmail.com>
References: <20200109200839.11936-1-eajames@linux.ibm.com>
To: Eddie James <eajames@linux.ibm.com>
X-Mailer: Apple Mail (2.3608.40.2.2.4)
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Jan 9, 2020, at 2:08 PM, Eddie James <eajames@linux.ibm.com> wrote:
>=20
> The hub FSI master can access the cfams on two other processors. =
Reflect
> this by adding a second cfam to the first hub description.
>=20
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
> arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 36 ++++++++++++++++++++
> 1 file changed, 36 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts =
b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index 4d8b3cc5f291..9318778a461b 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -143,6 +143,38 @@
> 			no-scan-on-init;
> 		};
> 	};
> +
> +	cfam@2,0 {
> +		reg =3D <2 0>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		chip-id =3D <2>;
> +
> +		scom@1000 {
> +			compatible =3D "ibm,fsi2pib";
> +			reg =3D <0x1000 0x400>;
> +		};
> +
> +		sbefifo@2400 {
> +			compatible =3D "ibm,p9-sbefifo";
> +			reg =3D <0x2400 0x400>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			fsi_occ2: occ {
> +				compatible =3D "ibm,p9-occ";
> +			};
> +		};
> +
> +		fsi_hub2: hub@3400 {
> +			compatible =3D "fsi-master-hub";
> +			reg =3D <0x3400 0x400>;
> +			#address-cells =3D <2>;
> +			#size-cells =3D <0>;
> +
> +			no-scan-on-init;
> +		};
> +	};
> };
>=20
> /* Legacy OCC numbering (to get rid of when userspace is fixed) */
> @@ -154,6 +186,10 @@
> 	reg =3D <2>;
> };
>=20
> +&fsi_occ2 {
> +	reg =3D <3>;
> +};
> +
> &ibt {
> 	status =3D "okay";
> };
> =E2=80=94=20
> 2.24.0
>=20

Looked good in testing.

Tested-by: Andrew Geissler  <geissonator@yahoo.com>=
