Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF8B5F296B
	for <lists+openbmc@lfdr.de>; Mon,  3 Oct 2022 09:19:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mgsdf11lxz3bkm
	for <lists+openbmc@lfdr.de>; Mon,  3 Oct 2022 18:19:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hFiZRArX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=bagasdotme@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hFiZRArX;
	dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mf9fK6mJRz3bkl
	for <openbmc@lists.ozlabs.org>; Fri, 30 Sep 2022 23:13:44 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id d11so3944899pll.8
        for <openbmc@lists.ozlabs.org>; Fri, 30 Sep 2022 06:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=X9KM69OWbNqe99lU/LyHll6cVAlUFLbhx1DFVUbHdTU=;
        b=hFiZRArXk1ldsgpRwUMxR66IwMxUdQL8wV3UrxSuZe5QzvWykTbfY8VOSDCaN+9dlv
         fGBr1SBBDK6Eg/7v6qjj3IpSkyBON/+Ku9IvFFs7YECy6pCyLy4nM7VMoA6SnJ+2X9Pb
         guBCg6ExR4WfrR+WPHMJ1DRSskdhR6ZP4hNqQw+pBqTZPFP7N9JkqijPOJ2ikTGzvS7g
         cft67T+RPkuHrEJCaH2dnEoro2FWs9TvYFlxskoygIxuOxWA11O/ra3B+Qy6Ey7bOqk2
         IPmzWB2Lwk98ka1tLCBrkAsAphPVK17YDpYwcBb/ekcrrGWsZevc+aJGTwejvp+FrOoX
         dbWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=X9KM69OWbNqe99lU/LyHll6cVAlUFLbhx1DFVUbHdTU=;
        b=Ofi/KMbg2R9v5sshN0RIKy/qYCGBrEuCrwoAGezCJfdFQs6E4c4lgiMjIhQMo+Cd3Y
         3uNOkIabY+uq8Din3OkCn2mTMN6XX3lcldrr05Hln3QacTKvX4fwc+RxGVy5wSFiK0Jc
         Ny+9OI2iei+yENz1lBKN6VGhGie2/TZDPBVrBBXNa6yjk0d5kpH7UPpELSRv226s9Tq5
         tpt0UrQTiynEm/2WSDK1ldQMbyynNNcqcP+DC0qbgFFCFI7AJk2ERhpQV6np2XyWocN6
         Gra+relOTxaJLrZ/wuDNV8q/11ParvzL6Qmw2CDKt9R+FoPVKpBz7bAiTa6cjdFrZmU3
         H+YQ==
X-Gm-Message-State: ACrzQf1vAmSkzFkikMyTpj9S4H5Ur3ixZabfZWXcxDVFM7wbneXDyHb8
	oy0nwiFpmih3dSR+hgCf62Q=
X-Google-Smtp-Source: AMsMyM7gr5XYRTLNIh0EXkBR9v55nmUox3xxb6R7y4awYfxnV82mTRbGhc+iX7jkJ4ehNbnoG1am/Q==
X-Received: by 2002:a17:902:ecc6:b0:178:3c7c:18ad with SMTP id a6-20020a170902ecc600b001783c7c18admr8882046plh.112.1664543621639;
        Fri, 30 Sep 2022 06:13:41 -0700 (PDT)
Received: from debian.me (subs02-180-214-232-22.three.co.id. [180.214.232.22])
        by smtp.gmail.com with ESMTPSA id y18-20020aa78f32000000b00542e190f6bcsm1725985pfr.102.2022.09.30.06.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 06:13:40 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 610671005BB; Fri, 30 Sep 2022 20:13:37 +0700 (WIB)
Date: Fri, 30 Sep 2022 20:13:37 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH v9 4/9] docs: misc-devices: (smpro-errmon) Add
 documentation
Message-ID: <YzbrgSE0958gjjgj@debian.me>
References: <20220929094321.770125-1-quan@os.amperecomputing.com>
 <20220929094321.770125-5-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yJ8yI3N9HDD1ZjGC"
Content-Disposition: inline
In-Reply-To: <20220929094321.770125-5-quan@os.amperecomputing.com>
X-Mailman-Approved-At: Mon, 03 Oct 2022 18:17:26 +1100
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Phong Vo <phong@os.amperecomputing.com>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dragan Cvetic <dragan.cvetic@xilinx.com>, Lee Jones <lee@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, thang@os.amperecomputing.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Derek Kiernan <derek.kiernan@xilinx.com>, Open Source Submission <patches@amperecomputing.com>, Thu Nguyen <thu@os.amperecomputing.com>, Guenter Roeck <linux@roeck-us.net>, macro@orcam.me.uk
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--yJ8yI3N9HDD1ZjGC
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 29, 2022 at 04:43:16PM +0700, Quan Nguyen wrote:
> Adds documentation for Ampere(R)'s Altra(R) SMpro errmon driver.

s/Adds/Add/

> diff --git a/Documentation/misc-devices/index.rst b/Documentation/misc-de=
vices/index.rst
> index 756be15a49a4..b74b3b34a235 100644
> --- a/Documentation/misc-devices/index.rst
> +++ b/Documentation/misc-devices/index.rst
> @@ -27,6 +27,7 @@ fit into other categories.
>     max6875
>     oxsemi-tornado
>     pci-endpoint-test
> +   smpro-errmon
>     spear-pcie-gadget
>     uacce
>     xilinx_sdfec
> diff --git a/Documentation/misc-devices/smpro-errmon.rst b/Documentation/=
misc-devices/smpro-errmon.rst
> new file mode 100644
> index 000000000000..b17f30a6cafd
> --- /dev/null
> +++ b/Documentation/misc-devices/smpro-errmon.rst
> @@ -0,0 +1,193 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +Kernel driver Ampere(R)'s Altra(R) SMpro errmon
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Supported chips:
> +
> +  * Ampere(R) Altra(R)
> +
> +    Prefix: 'smpro'
> +
> +    Preference: Altra SoC BMC Interface Specification
> +
> +Author: Thu Nguyen <thu@os.amperecomputing.com>
> +
> +Description
> +-----------
> +
> +This driver supports hardware monitoring for Ampere(R) Altra(R) SoC's ba=
sed on the
> +SMpro co-processor (SMpro).
> +The following SoC alert/event types are supported by the errmon driver:
> +
> +* Core CE/UE error
> +* Memory CE/UE error
> +* PCIe CE/UE error
> +* Other CE/UE error
> +* Internal SMpro/PMpro error
> +* VRD hot
> +* VRD warn/fault
> +* DIMM Hot
> +
> +The SMpro interface provides the registers to query the status of the So=
C alerts/events
> +and their data and export to userspace by this driver.
> +
> +The SoC alerts/events will be referenced as error below.
> +
> +Usage Notes
> +-----------
> +
> +SMpro errmon driver creates the sysfs files for each error type.
> +Example: ``error_core_ce`` to get Core CE error type.
> +
> +* If the error is absented, the sysfs file returns empty.
> +* If the errors are presented, one each read to the sysfs, the oldest er=
ror will be returned and clear, the next read will be returned with the nex=
t error until all the errors are read out.
> +
> +For each host error type, SMpro keeps a latest max number of errors. All=
 the oldest errors that were not read out will be dropped. In that case, th=
e read to the corresponding overflow sysfs will return 1, otherwise, return=
 0.
> +Example: ``overflow_core_ce`` to report the overflow status of Core CE e=
rror type.
> +
> +The format of the error is depended on the error type.
> +
> +1) For Core/Memory/PCIe/Other CE/UE error types::
> +
> +The return 48-byte in hex format in table below:
> +
> +    =3D=3D=3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D   =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> +    OFFSET    FIELD           SIZE (BYTE)   DESCRIPTION
> +    =3D=3D=3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D   =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> +    00        Error Type      1             See Table below for details
> +    01        Subtype         1             See Table below for details
> +    02        Instance        2             See Table below for details
> +    04        Error status    4             See ARM RAS specification fo=
r details
> +    08        Error Address   8             See ARM RAS specification fo=
r details
> +    16        Error Misc 0    8             See ARM RAS specification fo=
r details
> +    24        Error Misc 1    8             See ARM RAS specification fo=
r details
> +    32        Error Misc 2    8             See ARM RAS specification fo=
r details
> +    40        Error Misc 3    8             See ARM RAS specification fo=
r details
> +    =3D=3D=3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D   =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> +
> +Below table defines the value of Error types, Sub Types, Sub component a=
nd instance:
> +
> +    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D    =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D    =3D=3D=3D=3D=3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +    Error Group     Error Type    Sub type    Sub component    Instance
> +    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D    =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D    =3D=3D=3D=3D=3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +    CPM (core)      0             0           Snoop-Logic      CPM #
> +    CPM (core)      0             2           Armv8 Core 1     CPM #
> +    MCU (mem)       1             1           ERR1             MCU # | S=
LOT << 11
> +    MCU (mem)       1             2           ERR2             MCU # | S=
LOT << 11
> +    MCU (mem)       1             3           ERR3             MCU #
> +    MCU (mem)       1             4           ERR4             MCU #
> +    MCU (mem)       1             5           ERR5             MCU #
> +    MCU (mem)       1             6           ERR6             MCU #
> +    MCU (mem)       1             7           Link Error       MCU #
> +    Mesh (other)    2             0           Cross Point      X | (Y <<=
 5) | NS <<11
> +    Mesh (other)    2             1           Home Node(IO)    X | (Y <<=
 5) | NS <<11
> +    Mesh (other)    2             2           Home Node(Mem)   X | (Y <<=
 5) | NS <<11 | device<<12
> +    Mesh (other)    2             4           CCIX Node        X | (Y <<=
 5) | NS <<11
> +    2P Link (other) 3             0           N/A              Altra 2P =
Link #
> +    GIC (other)     5             0           ERR0             0
> +    GIC (other)     5             1           ERR1             0
> +    GIC (other)     5             2           ERR2             0
> +    GIC (other)     5             3           ERR3             0
> +    GIC (other)     5             4           ERR4             0
> +    GIC (other)     5             5           ERR5             0
> +    GIC (other)     5             6           ERR6             0
> +    GIC (other)     5             7           ERR7             0
> +    GIC (other)     5             8           ERR8             0
> +    GIC (other)     5             9           ERR9             0
> +    GIC (other)     5             10          ERR10            0
> +    GIC (other)     5             11          ERR11            0
> +    GIC (other)     5             12          ERR12            0
> +    GIC (other)     5             13-21       ERR13            RC# + 1
> +    SMMU (other)    6             TCU         100              RC #
> +    SMMU (other)    6             TBU0        0                RC #
> +    SMMU (other)    6             TBU1        1                RC #
> +    SMMU (other)    6             TBU2        2                RC #
> +    SMMU (other)    6             TBU3        3                RC #
> +    SMMU (other)    6             TBU4        4                RC #
> +    SMMU (other)    6             TBU5        5                RC #
> +    SMMU (other)    6             TBU6        6                RC #
> +    SMMU (other)    6             TBU7        7                RC #
> +    SMMU (other)    6             TBU8        8                RC #
> +    SMMU (other)    6             TBU9        9                RC #
> +    PCIe AER (pcie) 7             Root        0                RC #
> +    PCIe AER (pcie) 7             Device      1                RC #
> +    PCIe RC (pcie)  8             RCA HB      0                RC #
> +    PCIe RC (pcie)  8             RCB HB      1                RC #
> +    PCIe RC (pcie)  8             RASDP       8                RC #
> +    OCM (other)     9             ERR0        0                0
> +    OCM (other)     9             ERR1        1                0
> +    OCM (other)     9             ERR2        2                0
> +    SMpro (other)   10            ERR0        0                0
> +    SMpro (other)   10            ERR1        1                0
> +    SMpro (other)   10            MPA_ERR     2                0
> +    PMpro (other)   11            ERR0        0                0
> +    PMpro (other)   11            ERR1        1                0
> +    PMpro (other)   11            MPA_ERR     2                0
> +    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D    =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D    =3D=3D=3D=3D=3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +    For example:
> +    # cat error_other_ue
> +    880807001e004010401040101500000001004010401040100c000000000000000000=
0000000000000000000000000000
> +
> +2) For the Internal SMpro/PMpro error types::
> +
> +The error_[smpro|pmro] sysfs returns string of 8-byte hex value:
> +    <4-byte hex value of Error info><4-byte hex value of Error extensive=
 data>
> +
> +The warn_[smpro|pmro] sysfs returns string of 4-byte hex value:
> +    <4-byte hex value of Warning info>
> +
> +Reference to Altra SoC BMC Interface Specification for the details.
> +
> +3) For the VRD hot, VRD /warn/fault, DIMM Hot event::
> +
> +The return string is 2-byte hex string value. Reference to section 5.7 G=
PI status register in Altra SoC BMC Interface Specification for the details.
> +
> +    Example:
> +    #cat event_vrd_hot
> +    0000
> +
> +Sysfs entries
> +-------------
> +
> +The following sysfs files are supported:
> +
> +* Ampere(R) Altra(R):
> +
> +Alert Types:
> +
> +    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +    Alert Type                Sysfs name         Description
> +    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +    Core CE Error             error_core_ce      Trigger when Core has C=
E error
> +    Core CE Error overflow    overflow_core_ce   Trigger when Core CE er=
ror overflow
> +    Core UE Error             error_core_ue      Trigger when Core has U=
E error
> +    Core UE Error overflow    overflow_core_ue   Trigger when Core UE er=
ror overflow
> +    Memory CE Error           error_mem_ce       Trigger when Memory has=
 CE error
> +    Memory CE Error overflow  overflow_mem_ce    Trigger when Memory CE =
error overflow
> +    Memory UE Error           error_mem_ue       Trigger when Memory has=
 UE error
> +    Memory UE Error overflow  overflow_mem_ue    Trigger when Memory UE =
error overflow
> +    PCIe CE Error             error_pcie_ce      Trigger when any PCIe c=
ontroller has CE error
> +    PCIe CE Error overflow    overflow_pcie_ce   Trigger when any PCIe c=
ontroller CE error overflow
> +    PCIe UE Error             error_pcie_ue      Trigger when any PCIe c=
ontroller has UE error
> +    PCIe UE Error overflow    overflow_pcie_ue   Trigger when any PCIe c=
ontroller UE error overflow
> +    Other CE Error            error_other_ce     Trigger when any Others=
 CE error
> +    Other CE Error overflow   overflow_other_ce  Trigger when any Others=
 CE error overflow
> +    Other UE Error            error_other_ue     Trigger when any Others=
 UE error
> +    Other UE Error overflow   overflow_other_ue  Trigger when Others UE =
error overflow
> +    SMpro Error               error_smpro        Trigger when system hav=
e SMpro error
> +    SMpro Warning             warn_smpro         Trigger when system hav=
e SMpro warning
> +    PMpro Error               error_pmpro        Trigger when system hav=
e PMpro error
> +    PMpro Warning             warn_pmpro         Trigger when system hav=
e PMpro warning
> +    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Event Type:
> +
> +    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> +    Event Type                   Sysfs name
> +    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> +    VRD HOT                      event_vrd_hot
> +    VR Warn/Fault                event_vrd_warn_fault
> +    DIMM Hot                     event_dimm_hot
> +    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D

The documentation above produces htmldocs warnings:
Documentation/misc-devices/smpro-errmon.rst:53: WARNING: Literal block expe=
cted; none found.
Documentation/misc-devices/smpro-errmon.rst:87: WARNING: Malformed table.
Text in column margin in table line 17.
<snipped>...
Documentation/misc-devices/smpro-errmon.rst:135: WARNING: Literal block exp=
ected; none found.
Documentation/misc-devices/smpro-errmon.rst:145: WARNING: Literal block exp=
ected; none found.

I have applied the fixup (with grammatical and formatting fixes):

---- >8 ----

diff --git a/Documentation/misc-devices/smpro-errmon.rst b/Documentation/mi=
sc-devices/smpro-errmon.rst
index b17f30a6cafdab..de8719cc47fd3c 100644
--- a/Documentation/misc-devices/smpro-errmon.rst
+++ b/Documentation/misc-devices/smpro-errmon.rst
@@ -7,18 +7,18 @@ Supported chips:
=20
   * Ampere(R) Altra(R)
=20
-    Prefix: 'smpro'
+    Prefix: `smpro`
=20
-    Preference: Altra SoC BMC Interface Specification
+    Reference: `Altra SoC BMC Interface Specification`
=20
 Author: Thu Nguyen <thu@os.amperecomputing.com>
=20
 Description
 -----------
=20
-This driver supports hardware monitoring for Ampere(R) Altra(R) SoC's base=
d on the
-SMpro co-processor (SMpro).
-The following SoC alert/event types are supported by the errmon driver:
+The smpro-errmon driver supports hardware monitoring for Ampere(R) Altra(R)
+SoCs based on the SMpro co-processor (SMpro). The following SoC alert/event
+types are supported by the driver:
=20
 * Core CE/UE error
 * Memory CE/UE error
@@ -29,165 +29,178 @@ The following SoC alert/event types are supported by =
the errmon driver:
 * VRD warn/fault
 * DIMM Hot
=20
-The SMpro interface provides the registers to query the status of the SoC =
alerts/events
-and their data and export to userspace by this driver.
+The SMpro interface provides the registers to query the status of the SoC
+alerts/events and their data and export to userspace by this driver.
=20
-The SoC alerts/events will be referenced as error below.
+The rest of this document will refer SoC alerts/events as errors.
=20
 Usage Notes
 -----------
=20
 SMpro errmon driver creates the sysfs files for each error type.
-Example: ``error_core_ce`` to get Core CE error type.
+See :ref:`smpro_sysfs` for the list of errors and the corresponding
+sysfs files.
=20
-* If the error is absented, the sysfs file returns empty.
-* If the errors are presented, one each read to the sysfs, the oldest erro=
r will be returned and clear, the next read will be returned with the next =
error until all the errors are read out.
+* If there is no errors, the sysfs file is empty.
+* Otherwise, when errors occur, the oldest error
+  will be returned on sysfs file reading and cleared. The next read will
+  return the next error until all the errors are read out.
=20
-For each host error type, SMpro keeps a latest max number of errors. All t=
he oldest errors that were not read out will be dropped. In that case, the =
read to the corresponding overflow sysfs will return 1, otherwise, return 0.
-Example: ``overflow_core_ce`` to report the overflow status of Core CE err=
or type.
+For each host error type, SMpro keeps a latest max number of errors. All t=
he
+oldest errors that were not read will be dropped. In that case, the read
+to the corresponding sysfs will return 1, otherwise return 0.
=20
-The format of the error is depended on the error type.
+The error format depends on its type.
=20
-1) For Core/Memory/PCIe/Other CE/UE error types::
+1) For Core/Memory/PCIe/Other CE/UE error types
=20
-The return 48-byte in hex format in table below:
+   These errors return 48-byte in hex format according to the table below:
=20
-    =3D=3D=3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D   =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
-    OFFSET    FIELD           SIZE (BYTE)   DESCRIPTION
-    =3D=3D=3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D   =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
-    00        Error Type      1             See Table below for details
-    01        Subtype         1             See Table below for details
-    02        Instance        2             See Table below for details
-    04        Error status    4             See ARM RAS specification for =
details
-    08        Error Address   8             See ARM RAS specification for =
details
-    16        Error Misc 0    8             See ARM RAS specification for =
details
-    24        Error Misc 1    8             See ARM RAS specification for =
details
-    32        Error Misc 2    8             See ARM RAS specification for =
details
-    40        Error Misc 3    8             See ARM RAS specification for =
details
-    =3D=3D=3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D   =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
+   =3D=3D=3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D   =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+   OFFSET    FIELD           SIZE (BYTE)   DESCRIPTION
+   =3D=3D=3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D   =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+   00        Error Type      1             See :ref:`the table below <smpr=
o-error-types>` for details
+   01        Subtype         1             See :ref:`the table below <smpr=
o-error-types>` for details
+   02        Instance        2             See :ref:`the table below <smpr=
o-error-types>` for details
+   04        Error status    4             See ARM RAS specification for d=
etails
+   08        Error Address   8             See ARM RAS specification for d=
etails
+   16        Error Misc 0    8             See ARM RAS specification for d=
etails
+   24        Error Misc 1    8             See ARM RAS specification for d=
etails
+   32        Error Misc 2    8             See ARM RAS specification for d=
etails
+   40        Error Misc 3    8             See ARM RAS specification for d=
etails
+   =3D=3D=3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D   =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
-Below table defines the value of Error types, Sub Types, Sub component and=
 instance:
+   The table below defines the value of error types, their subtype, subcom=
ponent and instance:
=20
-    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
    =3D=3D=3D=3D=3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-    Error Group     Error Type    Sub type    Sub component    Instance
-    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
    =3D=3D=3D=3D=3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-    CPM (core)      0             0           Snoop-Logic      CPM #
-    CPM (core)      0             2           Armv8 Core 1     CPM #
-    MCU (mem)       1             1           ERR1             MCU # | SLO=
T << 11
-    MCU (mem)       1             2           ERR2             MCU # | SLO=
T << 11
-    MCU (mem)       1             3           ERR3             MCU #
-    MCU (mem)       1             4           ERR4             MCU #
-    MCU (mem)       1             5           ERR5             MCU #
-    MCU (mem)       1             6           ERR6             MCU #
-    MCU (mem)       1             7           Link Error       MCU #
-    Mesh (other)    2             0           Cross Point      X | (Y << 5=
) | NS <<11
-    Mesh (other)    2             1           Home Node(IO)    X | (Y << 5=
) | NS <<11
-    Mesh (other)    2             2           Home Node(Mem)   X | (Y << 5=
) | NS <<11 | device<<12
-    Mesh (other)    2             4           CCIX Node        X | (Y << 5=
) | NS <<11
-    2P Link (other) 3             0           N/A              Altra 2P Li=
nk #
-    GIC (other)     5             0           ERR0             0
-    GIC (other)     5             1           ERR1             0
-    GIC (other)     5             2           ERR2             0
-    GIC (other)     5             3           ERR3             0
-    GIC (other)     5             4           ERR4             0
-    GIC (other)     5             5           ERR5             0
-    GIC (other)     5             6           ERR6             0
-    GIC (other)     5             7           ERR7             0
-    GIC (other)     5             8           ERR8             0
-    GIC (other)     5             9           ERR9             0
-    GIC (other)     5             10          ERR10            0
-    GIC (other)     5             11          ERR11            0
-    GIC (other)     5             12          ERR12            0
-    GIC (other)     5             13-21       ERR13            RC# + 1
-    SMMU (other)    6             TCU         100              RC #
-    SMMU (other)    6             TBU0        0                RC #
-    SMMU (other)    6             TBU1        1                RC #
-    SMMU (other)    6             TBU2        2                RC #
-    SMMU (other)    6             TBU3        3                RC #
-    SMMU (other)    6             TBU4        4                RC #
-    SMMU (other)    6             TBU5        5                RC #
-    SMMU (other)    6             TBU6        6                RC #
-    SMMU (other)    6             TBU7        7                RC #
-    SMMU (other)    6             TBU8        8                RC #
-    SMMU (other)    6             TBU9        9                RC #
-    PCIe AER (pcie) 7             Root        0                RC #
-    PCIe AER (pcie) 7             Device      1                RC #
-    PCIe RC (pcie)  8             RCA HB      0                RC #
-    PCIe RC (pcie)  8             RCB HB      1                RC #
-    PCIe RC (pcie)  8             RASDP       8                RC #
-    OCM (other)     9             ERR0        0                0
-    OCM (other)     9             ERR1        1                0
-    OCM (other)     9             ERR2        2                0
-    SMpro (other)   10            ERR0        0                0
-    SMpro (other)   10            ERR1        1                0
-    SMpro (other)   10            MPA_ERR     2                0
-    PMpro (other)   11            ERR0        0                0
-    PMpro (other)   11            ERR1        1                0
-    PMpro (other)   11            MPA_ERR     2                0
-    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
    =3D=3D=3D=3D=3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+   .. _smpro-error-types:
=20
-    For example:
-    # cat error_other_ue
-    880807001e004010401040101500000001004010401040100c00000000000000000000=
00000000000000000000000000
+   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D    =3D=3D=3D=3D=3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+   Error Group     Error Type    Sub type    Sub component    Instance
+   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D    =3D=3D=3D=3D=3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+   CPM (core)      0             0           Snoop-Logic      CPM #
+   CPM (core)      0             2           Armv8 Core 1     CPM #
+   MCU (mem)       1             1           ERR1             MCU # | SLOT=
 << 11
+   MCU (mem)       1             2           ERR2             MCU # | SLOT=
 << 11
+   MCU (mem)       1             3           ERR3             MCU #
+   MCU (mem)       1             4           ERR4             MCU #
+   MCU (mem)       1             5           ERR5             MCU #
+   MCU (mem)       1             6           ERR6             MCU #
+   MCU (mem)       1             7           Link Error       MCU #
+   Mesh (other)    2             0           Cross Point      X | (Y << 5)=
 | NS <<11
+   Mesh (other)    2             1           Home Node(IO)    X | (Y << 5)=
 | NS <<11
+   Mesh (other)    2             2           Home Node(Mem)   X | (Y << 5)=
 | NS <<11 | device<<12
+   Mesh (other)    2             4           CCIX Node        X | (Y << 5)=
 | NS <<11
+   2P Link (other) 3             0           N/A              Altra 2P Lin=
k #
+   GIC (other)     5             0           ERR0             0
+   GIC (other)     5             1           ERR1             0
+   GIC (other)     5             2           ERR2             0
+   GIC (other)     5             3           ERR3             0
+   GIC (other)     5             4           ERR4             0
+   GIC (other)     5             5           ERR5             0
+   GIC (other)     5             6           ERR6             0
+   GIC (other)     5             7           ERR7             0
+   GIC (other)     5             8           ERR8             0
+   GIC (other)     5             9           ERR9             0
+   GIC (other)     5             10          ERR10            0
+   GIC (other)     5             11          ERR11            0
+   GIC (other)     5             12          ERR12            0
+   GIC (other)     5             13-21       ERR13            RC# + 1
+   SMMU (other)    6             TCU         100              RC #
+   SMMU (other)    6             TBU0        0                RC #
+   SMMU (other)    6             TBU1        1                RC #
+   SMMU (other)    6             TBU2        2                RC #
+   SMMU (other)    6             TBU3        3                RC #
+   SMMU (other)    6             TBU4        4                RC #
+   SMMU (other)    6             TBU5        5                RC #
+   SMMU (other)    6             TBU6        6                RC #
+   SMMU (other)    6             TBU7        7                RC #
+   SMMU (other)    6             TBU8        8                RC #
+   SMMU (other)    6             TBU9        9                RC #
+   PCIe AER (pcie) 7             Root        0                RC #
+   PCIe AER (pcie) 7             Device      1                RC #
+   PCIe RC (pcie)  8             RCA HB      0                RC #
+   PCIe RC (pcie)  8             RCB HB      1                RC #
+   PCIe RC (pcie)  8             RASDP       8                RC #
+   OCM (other)     9             ERR0        0                0
+   OCM (other)     9             ERR1        1                0
+   OCM (other)     9             ERR2        2                0
+   SMpro (other)   10            ERR0        0                0
+   SMpro (other)   10            ERR1        1                0
+   SMpro (other)   10            MPA_ERR     2                0
+   PMpro (other)   11            ERR0        0                0
+   PMpro (other)   11            ERR1        1                0
+   PMpro (other)   11            MPA_ERR     2                0
+   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D    =3D=3D=3D=3D=3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
-2) For the Internal SMpro/PMpro error types::
+   Example::
=20
-The error_[smpro|pmro] sysfs returns string of 8-byte hex value:
-    <4-byte hex value of Error info><4-byte hex value of Error extensive d=
ata>
+     # cat error_other_ue
+     880807001e004010401040101500000001004010401040100c0000000000000000000=
000000000000000000000000000
=20
-The warn_[smpro|pmro] sysfs returns string of 4-byte hex value:
-    <4-byte hex value of Warning info>
+2) For the internal SMpro/PMpro error types
=20
-Reference to Altra SoC BMC Interface Specification for the details.
+   The ``error_[smpro|pmro]`` sysfs returns string of 8-byte hex value::
=20
-3) For the VRD hot, VRD /warn/fault, DIMM Hot event::
+     <4-byte hex value of Error info><4-byte hex value of Error extensive =
data>
=20
-The return string is 2-byte hex string value. Reference to section 5.7 GPI=
 status register in Altra SoC BMC Interface Specification for the details.
+   The ``warn_[smpro|pmro]`` sysfs returns string of 4-byte hex value::
=20
-    Example:
-    #cat event_vrd_hot
-    0000
+     <4-byte hex value of Warning info>
+
+   Refer to `Altra SoC BMC Interface Specification` for details.
+
+3) For the VRD hot, VRD warn/fault, DIMM Hot event
+
+   The return string is 2-byte hex string value. Refer to section `5.7 GPI
+   status register` in `Altra SoC BMC Interface Specification` for details=
=2E=20
+
+   Example::
+
+      #cat event_vrd_hot
+      0000
+
+.. _smpro_sysfs:
=20
 Sysfs entries
 -------------
=20
 The following sysfs files are supported:
=20
-* Ampere(R) Altra(R):
+* Ampere(R) Altra(R)
=20
-Alert Types:
+  Alert types:
=20
-    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-    Alert Type                Sysfs name         Description
-    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-    Core CE Error             error_core_ce      Trigger when Core has CE =
error
-    Core CE Error overflow    overflow_core_ce   Trigger when Core CE erro=
r overflow
-    Core UE Error             error_core_ue      Trigger when Core has UE =
error
-    Core UE Error overflow    overflow_core_ue   Trigger when Core UE erro=
r overflow
-    Memory CE Error           error_mem_ce       Trigger when Memory has C=
E error
-    Memory CE Error overflow  overflow_mem_ce    Trigger when Memory CE er=
ror overflow
-    Memory UE Error           error_mem_ue       Trigger when Memory has U=
E error
-    Memory UE Error overflow  overflow_mem_ue    Trigger when Memory UE er=
ror overflow
-    PCIe CE Error             error_pcie_ce      Trigger when any PCIe con=
troller has CE error
-    PCIe CE Error overflow    overflow_pcie_ce   Trigger when any PCIe con=
troller CE error overflow
-    PCIe UE Error             error_pcie_ue      Trigger when any PCIe con=
troller has UE error
-    PCIe UE Error overflow    overflow_pcie_ue   Trigger when any PCIe con=
troller UE error overflow
-    Other CE Error            error_other_ce     Trigger when any Others C=
E error
-    Other CE Error overflow   overflow_other_ce  Trigger when any Others C=
E error overflow
-    Other UE Error            error_other_ue     Trigger when any Others U=
E error
-    Other UE Error overflow   overflow_other_ue  Trigger when Others UE er=
ror overflow
-    SMpro Error               error_smpro        Trigger when system have =
SMpro error
-    SMpro Warning             warn_smpro         Trigger when system have =
SMpro warning
-    PMpro Error               error_pmpro        Trigger when system have =
PMpro error
-    PMpro Warning             warn_pmpro         Trigger when system have =
PMpro warning
-    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+    Alert type                Sysfs name             Description (when the=
 error is triggered)
+    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+    Core CE Error             ``error_core_ce``      Core has CE error
+    Core CE Error overflow    ``overflow_core_ce``   Core CE error overflow
+    Core UE Error             ``error_core_ue``      Core has UE error
+    Core UE Error overflow    ``overflow_core_ue``   Core UE error overflow
+    Memory CE Error           ``error_mem_ce``       Memory has CE error
+    Memory CE Error overflow  ``overflow_mem_ce``    Memory CE error overf=
low
+    Memory UE Error           ``error_mem_ue``       Memory has UE error
+    Memory UE Error overflow  ``overflow_mem_ue``    Memory UE error overf=
low
+    PCIe CE Error             ``error_pcie_ce``      any PCIe controller h=
as CE error
+    PCIe CE Error overflow    ``overflow_pcie_ce``   any PCIe controller C=
E error overflow
+    PCIe UE Error             ``error_pcie_ue``      any PCIe controller h=
as UE error
+    PCIe UE Error overflow    ``overflow_pcie_ue``   any PCIe controller U=
E error overflow
+    Other CE Error            ``error_other_ce``     any other CE error
+    Other CE Error overflow   ``overflow_other_ce``  any other CE error ov=
erflow
+    Other UE Error            ``error_other_ue``     any other UE error
+    Other UE Error overflow   ``overflow_other_ue``  other UE error overfl=
ow
+    SMpro Error               ``error_smpro``        system have SMpro err=
or
+    SMpro Warning             ``warn_smpro``         system have SMpro war=
ning
+    PMpro Error               ``error_pmpro``        system have PMpro err=
or
+    PMpro Warning             ``warn_pmpro``         system have PMpro war=
ning
+    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
-Event Type:
+  Event types:
=20
     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
-    Event Type                   Sysfs name
+    Event type                   Sysfs name
     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
-    VRD HOT                      event_vrd_hot
-    VR Warn/Fault                event_vrd_warn_fault
-    DIMM Hot                     event_dimm_hot
+    VRD HOT                      ``event_vrd_hot``
+    VR Warn/Fault                ``event_vrd_warn_fault``
+    DIMM Hot                     ``event_dimm_hot``
     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--yJ8yI3N9HDD1ZjGC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCYzbregAKCRD2uYlJVVFO
o1FoAQDFhyGFwxZleSOB0bfl0xiG1z1TxaRA+2d2u6Tm6OX8ZAEA4QmxE1/OXqNy
WUYHX/gsqj+Rx6WpNuSGeEGX3JrUzA4=
=qjWM
-----END PGP SIGNATURE-----

--yJ8yI3N9HDD1ZjGC--
