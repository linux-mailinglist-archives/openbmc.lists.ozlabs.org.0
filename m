Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 349CB4577C1
	for <lists+openbmc@lfdr.de>; Fri, 19 Nov 2021 21:30:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HwpFt5qZdz3bsp
	for <lists+openbmc@lfdr.de>; Sat, 20 Nov 2021 07:30:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZqGnt41e;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32f;
 helo=mail-ot1-x32f.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ZqGnt41e; dkim-atps=neutral
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HwpFT281Bz2yyv
 for <openbmc@lists.ozlabs.org>; Sat, 20 Nov 2021 07:30:19 +1100 (AEDT)
Received: by mail-ot1-x32f.google.com with SMTP id
 47-20020a9d0332000000b005798ac20d72so18311otv.9
 for <openbmc@lists.ozlabs.org>; Fri, 19 Nov 2021 12:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=cPoYe8aIyzyhlKwK81Muc84iR48wZ+akWzIz4+rkufk=;
 b=ZqGnt41eO2WzMy5Q+Zdw+0jQj0hf8Aa+Pjhu/RtVodWNCiuG8RUWeE8B6xmBLVzeE/
 cqsCNr2XAe8nNCr1SWABQgkokdmuKUBALiCCwAidyKETFngpVzRVh25X3D0J7k12velF
 36oVh/28Hu8C24XhiCeKHZKikJZOKyE3hCUFx2+Yf2iWKqUnuFnbxxIYS7EAEqJ3vH7u
 jWyNTwGSND2hJZh3f9PB+JW7eM313wBW4lmkz9LADIJsIt1V76aLB4zbMuF7BzdQ5Y0+
 wZDMyixMSQQd9fadVoKpOTZENeX1LlysRXgd4QNV4zhZIuILp4uIylO2EAblf75htG7F
 Nsyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=cPoYe8aIyzyhlKwK81Muc84iR48wZ+akWzIz4+rkufk=;
 b=SfN1YUDr0DT1QdmBZcgLKcZNmpuGEVkmwyKjz8mj8me8mgS0JXtVKNAl5bbUCKMNg4
 fi+NpRGJiyCeiy4epp6off/tEMhl63ppbvW8GCn3afxOsSOpmYAGQ3AcYNexRvCzXOXL
 swIrHLXzalXiJrXA3rL/hLZTqDjQJ6Mz36k8LgQVslu/yXA2yZd7L/UBbYUKv09qgI8W
 SUTFYvtshVOgO8xo6q8mBRntDLEwPTZtcFVdlUU67uQ5Ks81k1PbyP4fFjvTiWKhV3Sl
 gY7tb9LqMLju+OrQ0Jq4HHl1UhrI867CfTubKwjRg35le9mrTnaB19M6/ubsPhVenPo8
 vsxg==
X-Gm-Message-State: AOAM530xM9brhedY/lI1jZmA1XIS7ya9q2nzprPi8RVTq3PZFGyS18Oi
 EM7EbBJjksTE+wJO794cZ4F0mvDtBnU=
X-Google-Smtp-Source: ABdhPJzORnmnSzCqTZjp18gEqUk/SIbf89EQiB3go8g6bV09sEmJTi/LuvJhWgrvKNGVxu4EaZPXdw==
X-Received: by 2002:a9d:4d90:: with SMTP id u16mr3176785otk.86.1637353813572; 
 Fri, 19 Nov 2021 12:30:13 -0800 (PST)
Received: from smtpclient.apple ([2600:1700:19e0:3310:8485:90d0:671b:cafe])
 by smtp.gmail.com with ESMTPSA id x197sm188601oix.32.2021.11.19.12.30.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Nov 2021 12:30:13 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed: add device tree for YADRO VEGMAN
 BMC
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <20211119120057.12118-3-a.kartashev@yadro.com>
Date: Fri, 19 Nov 2021 14:30:12 -0600
Content-Transfer-Encoding: quoted-printable
Message-Id: <FA1B4FAF-387D-4D71-952A-D44B493FC67B@gmail.com>
References: <20211119120057.12118-1-a.kartashev@yadro.com>
 <20211119120057.12118-3-a.kartashev@yadro.com>
To: Andrei Kartashev <a.kartashev@yadro.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
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
Cc: Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
 openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Nov 19, 2021, at 6:00 AM, Andrei Kartashev <a.kartashev@yadro.com> =
wrote:
>=20
> YADRO VEGMAN is x86 based servers family with ASPEED AST2500-based =
BMC.
> Currently there are three models:
> * VEGMAN N110
> * VEGMAN S220/320
> * VEGMAN R120/220
>=20
> The dts files provides configuration for BMC system.
>=20
> Signed-off-by: Andrei Kartashev <a.kartashev@yadro.com>
> ---
> arch/arm/boot/dts/Makefile                   |   5 +-
> arch/arm/boot/dts/aspeed-bmc-vegman-n110.dts | 149 +++++++++
> arch/arm/boot/dts/aspeed-bmc-vegman-rx20.dts | 255 +++++++++++++++
> arch/arm/boot/dts/aspeed-bmc-vegman-sx20.dts | 154 +++++++++
> arch/arm/boot/dts/aspeed-bmc-vegman.dtsi     | 311 +++++++++++++++++++
> 5 files changed, 873 insertions(+), 1 deletion(-)
> create mode 100644 arch/arm/boot/dts/aspeed-bmc-vegman-n110.dts
> create mode 100644 arch/arm/boot/dts/aspeed-bmc-vegman-rx20.dts
> create mode 100644 arch/arm/boot/dts/aspeed-bmc-vegman-sx20.dts
> create mode 100644 arch/arm/boot/dts/aspeed-bmc-vegman.dtsi
>=20
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 0de64f237cd8..78b71e02624c 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1519,4 +1519,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \
> 	aspeed-bmc-quanta-q71l.dtb \
> 	aspeed-bmc-supermicro-x11spi.dtb \
> 	aspeed-bmc-inventec-transformers.dtb \
> -	aspeed-bmc-tyan-s7106.dtb
> +	aspeed-bmc-tyan-s7106.dtb \
> +	aspeed-bmc-vegman-n110.dtb \
> +	aspeed-bmc-vegman-rx20.dtb \
> +	aspeed-bmc-vegman-sx20.dtb
> diff --git a/arch/arm/boot/dts/aspeed-bmc-vegman-n110.dts =
b/arch/arm/boot/dts/aspeed-bmc-vegman-n110.dts
> new file mode 100644
> index 000000000000..24319267d550
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-vegman-n110.dts
> @@ -0,0 +1,149 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +// Copyright (C) 2021 YADRO
> +/dts-v1/;
> +
> +#include "aspeed-bmc-vegman.dtsi"
> +
> +/ {
> +	model =3D "YADRO VEGMAN N110 BMC";
> +	compatible =3D "yadro,vegman-n110-bmc", "aspeed,ast2500";
> +};
> +
> +&gpio {
> +	status =3D "okay";
> +	gpio-line-names =3D
> +	/*A0-A7*/	=
"CHASSIS_INTRUSION","CASE_OPEN_FAULT_RST","","","SPEAKER_BMC","FM_FORCE_BM=
C_UPDATE","","",
> +	/*B0-B7*/	"","","","","","","","",
> +	/*C0-C7*/	"","","","","","","","",
> +	/*D0-D7*/	"","","","","","","","",
> +	/*E0-E7*/	=
"RESET_BUTTON","RESET_OUT","POWER_BUTTON","POWER_OUT","","","","",
> +	/*F0-F7*/	=
"NMI_OUT","PCIE_NIC_ALERT","","","SKT0_FAULT_LED","","RST_RGMII_PHYRST_DNP=
","",
> +	/*G0-G7*/	=
"CPU_ERR2","CPU_CATERR","PCH_BMC_THERMTRIP","","IRQ_NMI_EVENT","","","",
> +	/*H0-H7*/	=
"PWRGD_P3V3_RISER1","PWRGD_P3V3_RISER2","PWRGD_P3V3_RISER3","","MIO_BIOS_S=
EL","_SPI_FLASH_HOLD","_SPI_FLASH_WP","FM_240VA_STATUS",
> +	/*I0-I7*/	"","","","","","","","",
> +	/*J0-J7*/	"","","","","","","","",
> +	/*K0-K7*/	"","","","","","","","",
> +	/*L0-L7*/	"","","","","","","","",
> +	/*M0-M7*/	"","","","","","","","",
> +	/*N0-N7*/	"","","","","","","","",
> +	/*O0-O7*/	"","","","","","","","_SPI2_BMC_CS_SEL",
> +	/*P0-P7*/	"","","","","","","","",
> +	/*Q0-Q7*/	"","","","","","","","",
> +	/*R0-R7*/	"_SPI_RMM4_LITE_CS","","","","","","","",
> +	/*S0-S7*/	=
"_SPI2_BMC_CS1","","","IRQ_SML0_ALERT_MUX","FP_LED_STATUS_GREEN","FP_LED_S=
TATUS_AMBER","FP_ID_LED","",
> +	/*T0-T7*/	"","","","","","","","",
> +	/*U0-U7*/	"","","","","","","","",
> +	/*V0-V7*/	"","","","","","","","",
> +	/*W0-W7*/	"","","","","","","","",
> +	/*X0-X7*/	"","","","","","","","",
> +	/*Y0-Y7*/	=
"SIO_S3","SIO_S5","","SIO_ONCONTROL","","","","",
> +	/*Z0-Z7*/	=
"FM_BMC_PWR_BTN","SIO_POWER_GOOD","FM_BMC_PWRBTN_OUT","FM_BMC_PCH_SCI_LPC"=
,"","","","",
> +	/*AA0-AA7*/	=
"","IRQ_SML1_PMBUS_ALERT","FM_PVCCIN_CPU0_PWR_IN_ALERT","FM_PVCCIN_CPU1_PW=
R_IN_ALERT","BMC_SYS_PWR_FAULT","BMC_SYS_PWR_OK","SMI","POST_COMPLETE",
> +	/*AB0-AB7*/	=
"FM_CPU_BMCINIT","NMI_BUTTON","ID_BUTTON","PS_PWROK","","","","",
> +	/*AC0-AC7*/	"","","","","","","","";
> +};

Can we utilize =
https://github.com/openbmc/docs/blob/master/designs/device-tree-gpio-namin=
g.md to get some consistent naming across the GPIO=E2=80=99s on OpenBMC =
machines?

