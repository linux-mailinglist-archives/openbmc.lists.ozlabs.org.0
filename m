Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC87D1A00B6
	for <lists+openbmc@lfdr.de>; Tue,  7 Apr 2020 00:14:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48x4b56n3yzDqwm
	for <lists+openbmc@lfdr.de>; Tue,  7 Apr 2020 08:14:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=173.167.31.197;
 helo=bajor.fuzziesquirrel.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48x4ZR4cbPzDq9J
 for <openbmc@lists.ozlabs.org>; Tue,  7 Apr 2020 08:14:06 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Content-Type: text/plain;
	charset=utf-8;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH] Remove checkstop GPIO from gpio-keys definitions
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <201a8252c5cf8d7af5f31075a52fd4c4@linux.vnet.ibm.com>
Date: Mon, 6 Apr 2020 18:14:00 -0400
Message-Id: <BFC8BAD7-C1ED-4A29-B366-6D785EFA0059@fuzziesquirrel.com>
References: <d51f1a31994d36b1dd98f1bd56260cc3@linux.vnet.ibm.com>
 <4FB1C77E-3FD5-4D56-AD67-BB4A57BE45C1@fuzziesquirrel.com>
 <201a8252c5cf8d7af5f31075a52fd4c4@linux.vnet.ibm.com>
To: bentyner <bentyner@linux.ibm.com>
Content-Transfer-Encoding: quoted-printable
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

at 3:22 PM, bentyner <bentyner@linux.ibm.com> wrote:

> The description does not match the content because I did what was =20
> recommended:
>
> "Apply the 0001-ARM-dts-Aspeed-Add-witherspoon-128-machine.patch to a =20
> kernel tree, make whatever edits you need to the device tree and then =20
> regenerate the (original) patch, and check this file back in."

Yep, when I gave this recommendation we were carrying the witherspoon 128=
 =20
device tree as a patch in the bitbake metadata.

Since then, the witherspoon 128 device tree was added to the OpenBMC kern=
el =20
tree, so we=E2=80=99ll have to adapt here.  Could you rebase on the lates=
t and send =20
it out again?

>
> The original patch added the device tree. My changes "subtract" from th=
e =20
> device tree that only exists because of the original patch.
>
>
> On 2020-04-06 12:35, Brad Bishop wrote:
>> at 8:16 AM, bentyner <bentyner@linux.ibm.com> wrote:
>>> From: Ben Tyner <ben.tyner@ibm.com>
>> Hi Ben.  How did you invoke git format-patch?  I wasn=E2=80=99t expect=
ing
>> this  line.  Have a read through
>> https://github.com/openbmc/linux/wiki/SubmittingPatches#use-the-git-to=
ols
>>  and see if that procedure gets rid of it.  Also "linux dev-5.4=E2=80=9D=
 is
>> needed  in the subject prefix so patchwork knows where to put this
>> (when submitted  correctly, you should be able to see your patch here:
>>  https://patchwork.ozlabs.org/project/linux-aspeed/list/
>>> Attention handler will monitor the checkstop gpio via the character
>>> device interface so it needs to not be defined.
>> This description doesn=E2=80=99t match the content - an entire device =
tree
>> has been  added.  Also I think you=E2=80=99ll need to rebase because I=
 see
>> that this DT was  recently added with
>> 0d8c8d99358588164430b3d89312ecea775a57f1.
>>> Signed-off-by: Ben Tyner <ben.tyner@ibm.com>
>>> ---
>>>  arch/arm/boot/dts/Makefile                    |  1 +
>>>  .../dts/aspeed-bmc-opp-witherspoon-128.dts    | 99 +++++++++++++++++=
++
>>>  2 files changed, 100 insertions(+)
>>>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon-128.=
dts
>>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>>> index fcd607ffe8d9..d6dfdf73e66b 100644
>>> --- a/arch/arm/boot/dts/Makefile
>>> +++ b/arch/arm/boot/dts/Makefile
>>> @@ -1303,6 +1303,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \
>>>  	aspeed-bmc-opp-tacoma.dtb \
>>>  	aspeed-bmc-opp-vesnin.dtb \
>>>  	aspeed-bmc-opp-witherspoon.dtb \
>>> +	aspeed-bmc-opp-witherspoon-128.dtb \
>>>  	aspeed-bmc-opp-zaius.dtb \
>>>  	aspeed-bmc-portwell-neptune.dtb \
>>>  	aspeed-bmc-quanta-q71l.dtb
>>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon-128.dts  =20
>>> b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon-128.dts
>>> new file mode 100644
>>> index 000000000000..701d58b7f0dc
>>> --- /dev/null
>>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon-128.dts
>>> @@ -0,0 +1,99 @@
>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>> +// Copyright 2019 IBM Corp.
>>> +/dts-v1/;
>>> +
>>> +#include "aspeed-bmc-opp-witherspoon.dts"
>>> +
>>> +/ {
>>> +	gpio-keys {
>>> +		/delete-node/ checkstop;
>>> +	};
>>> +};
>>> +
>>> +&gpio {
>>> +	gpio-line-names =3D
>>> +	/*A0-A7*/	"","cfam-reset","","","","","fsi-mux","",
>>> +	/*B0-B7*/	"","","","","","air-water","","",
>>> +	/*C0-C7*/	"","","","","","","","",
>>> +	/*D0-D7*/	"fsi-enable","","","","","","","",
>>> +	/*E0-E7*/	"fsi-data","","","","","","","",
>>> +	/*F0-F7*/	"","","","","","","","",
>>> +	/*G0-G7*/	"","","","","","","","",
>>> +	/*H0-H7*/	"","","","","","","","",
>>> +	/*I0-I7*/	"","","","","","","","",
>>> +	/*J0-J7*/	"","","","","","","","",
>>> +	/*K0-K7*/	"","","","","","","","",
>>> +	/*L0-L7*/	"","","","","","","","",
>>> +	/*M0-M7*/	"","","","","","","","",
>>> +	/*N0-N7*/	"presence-ps1","","led-rear-fault","led-rear-power",
>>> +		        "led-rear-id","","","",
>>> +	/*O0-O7*/	"","","","","","","","",
>>> +	/*P0-P7*/	"","","","","","","","presence-ps0",
>>> +	/*Q0-Q7*/	"","","","","","","","",
>>> +	/*R0-R7*/	"","","fsi-trans","","","power-button","","",
>>> +	/*S0-S7*/	"","","","","","","","",
>>> +	/*T0-T7*/	"","","","","","","","",
>>> +	/*U0-U7*/	"","","","","","","","",
>>> +	/*V0-V7*/	"","","","","","","","",
>>> +	/*W0-W7*/	"","","","","","","","",
>>> +	/*X0-X7*/	"","","","","","","","",
>>> +	/*Y0-Y7*/	"","","","","","","","",
>>> +	/*Z0-Z7*/	"","","","","","","","",
>>> +	/*AA0-AA7*/	"fsi-clock","","","","","","","",
>>> +	/*AB0-AB7*/	"","","","","","","","",
>>> +	/*AC0-AC7*/	"","","","","","","","";
>>> +};
>>> +
>>> +&fmc {
>>> +	status =3D "okay";
>>> +
>>> +	flash@0 {
>>> +		status =3D "okay";
>>> +		label =3D "bmc";
>>> +		m25p,fast-read;
>>> +		spi-max-frequency =3D <100000000>;
>>> +
>>> +		partitions {
>>> +			#address-cells =3D < 1 >;
>>> +			#size-cells =3D < 1 >;
>>> +			compatible =3D "fixed-partitions";
>>> +			u-boot@0 {
>>> +				reg =3D < 0 0x60000 >;
>>> +				label =3D "u-boot";
>>> +			};
>>> +			u-boot-env@60000 {
>>> +				reg =3D < 0x60000 0x20000 >;
>>> +				label =3D "u-boot-env";
>>> +			};
>>> +			obmc-ubi@80000 {
>>> +				reg =3D < 0x80000 0x7F80000>;
>>> +				label =3D "obmc-ubi";
>>> +			};
>>> +		};
>>> +	};
>>> +
>>> +	flash@1 {
>>> +		status =3D "okay";
>>> +		label =3D "alt-bmc";
>>> +		m25p,fast-read;
>>> +		spi-max-frequency =3D <100000000>;
>>> +
>>> +		partitions {
>>> +			#address-cells =3D < 1 >;
>>> +			#size-cells =3D < 1 >;
>>> +			compatible =3D "fixed-partitions";
>>> +			u-boot@0 {
>>> +				reg =3D < 0 0x60000 >;
>>> +				label =3D "alt-u-boot";
>>> +			};
>>> +			u-boot-env@60000 {
>>> +				reg =3D < 0x60000 0x20000 >;
>>> +				label =3D "alt-u-boot-env";
>>> +			};
>>> +			obmc-ubi@80000 {
>>> +				reg =3D < 0x80000 0x7F80000>;
>>> +				label =3D "alt-obmc-ubi";
>>> +			};
>>> +		};
>>> +	};
>>> +};
>>> =E2=80=94
>>> 2.20.1

