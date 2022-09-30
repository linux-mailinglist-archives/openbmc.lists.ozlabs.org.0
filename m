Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0685F2961
	for <lists+openbmc@lfdr.de>; Mon,  3 Oct 2022 09:18:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mgsct3LRyz2xb4
	for <lists+openbmc@lfdr.de>; Mon,  3 Oct 2022 18:18:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TlZV7Yu6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=bagasdotme@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TlZV7Yu6;
	dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mf4sm3kDfz3bhy
	for <openbmc@lists.ozlabs.org>; Fri, 30 Sep 2022 19:38:18 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id u12so3779035pjj.1
        for <openbmc@lists.ozlabs.org>; Fri, 30 Sep 2022 02:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=vGNPCEtLFhWjfK9IXcgU0eqgNukRg8dBOh1kmfIugDc=;
        b=TlZV7Yu6bLgOiddHXSBLZd7CK9ZKlbrAxvAPMZDWN30ox2qkD4yR/fW4/s03iMLL8b
         X8inC57H6O8bNIFUfvBR5jynzAGnLJ2MLRUd0hYevYW7fxT4DW/4R/Q6+wbASf1xXoRI
         u/xY4KRM2nOLSpNMFhOgjZTadeveyicND3Yc4RnwAmshUYGFkWX9wBqtqHxQ6SfCX1Ux
         SIi5oUH/8aMd211aS0yr8UJNO3rokwaVMnQKkEXaSE7dkvrBtuQylkjqy57OkAINfqmh
         TwYLLcCgdwFs+beXEFD4x1npY8suH2CHuYbpFEyQRwyel70SExxFtEzF7USjmYURAbJX
         kw1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=vGNPCEtLFhWjfK9IXcgU0eqgNukRg8dBOh1kmfIugDc=;
        b=srR2dYNx04w5S/bygniXF/ohgLw72o0oH6N/G8Tj916a5ad+CyiIOLYPUXPAoUvH4u
         xSz8aRN3KZZHfM0QdSVv38qb4yhk97J0/A04Y9mJLrV3smVKdnUEL6mcm+aCMSYb1lPr
         XI9pjHlPyGFd6R415faBI6YZOekKKvr7tnPTDyATYRsbtWdfptfPX2UPPfg7mJpsQzNE
         2nglv2CTczqt4XtE/T3zX1OjhLfYzxEnNO9HUFxzHeU5R5cKbzphlctt/XJ69pSR2f4f
         PFFbrwtNQR0d3tJEH3bWsN1Oyi6TG3N0/HHIdiO/2/Zm4IsNiXo54oCkbdN4TZbKPuu1
         W3Mg==
X-Gm-Message-State: ACrzQf09RwT/tRCxNSqAIYNtX8rN02mXElXzTgSV4eidOO4/59iogZaF
	n06fTcUz9hEY8wC9tSunxlA=
X-Google-Smtp-Source: AMsMyM6Tysv9I/TfW5N5DdZ3nVlO6jJR0Vkk+lJOnV/5UmqJrpM/rddNW+Vj2qAk9z8Q/RCD2gDi8g==
X-Received: by 2002:a17:902:d70e:b0:178:2d9d:ba7b with SMTP id w14-20020a170902d70e00b001782d9dba7bmr8014206ply.90.1664530695076;
        Fri, 30 Sep 2022 02:38:15 -0700 (PDT)
Received: from debian.me (subs32-116-206-28-35.three.co.id. [116.206.28.35])
        by smtp.gmail.com with ESMTPSA id gm7-20020a17090b100700b0020599274efdsm1252960pjb.0.2022.09.30.02.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 02:38:14 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 444661005BB; Fri, 30 Sep 2022 16:38:11 +0700 (WIB)
Date: Fri, 30 Sep 2022 16:38:11 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH v9 9/9] docs: ABI: testing: Document the Ampere Altra
 Family's SMpro sysfs interfaces
Message-ID: <Yza5AyTDyM5yo7HG@debian.me>
References: <20220929094321.770125-1-quan@os.amperecomputing.com>
 <20220929094321.770125-10-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kUsQPpaU0BXqgnpI"
Content-Disposition: inline
In-Reply-To: <20220929094321.770125-10-quan@os.amperecomputing.com>
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


--kUsQPpaU0BXqgnpI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 29, 2022 at 04:43:21PM +0700, Quan Nguyen wrote:
> diff --git a/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-=
smpro b/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro
> new file mode 100644
> index 000000000000..d8f82a06570d
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro
> @@ -0,0 +1,125 @@
> +What:		/sys/bus/platform/devices/smpro-errmon.*/error_[core|mem|pcie|oth=
er]_[ce|ue]
> +KernelVersion:	5.18
> +Contact:	quan@os.amperecomputing.com
> +Description:
> +		(RO) Contains the 48-byte Ampere (Vendor-Specific) Error Record printed
> +		in hex format.
> +
> +		The detail of each sysfs entries is as below:
> +		+-------------+-------------------------------------------------------=
--+
> +		|   Error     |                   Sysfs entry                         =
  |
> +		+-------------+-------------------------------------------------------=
--+
> +		| Core's CE   | /sys/bus/platform/devices/smpro-errmon.*/error_core_ce=
 |
> +		| Core's UE   | /sys/bus/platform/devices/smpro-errmon.*/error_core_ue=
 |
> +		| Memory's CE | /sys/bus/platform/devices/smpro-errmon.*/error_mem_ce =
 |
> +		| Memory's UE | /sys/bus/platform/devices/smpro-errmon.*/error_mem_ue =
 |
> +		| PCIe's CE   | /sys/bus/platform/devices/smpro-errmon.*/error_pcie_ce=
 |
> +		| PCIe's UE   | /sys/bus/platform/devices/smpro-errmon.*/error_pcie_ue=
 |
> +		| Other's CE  | /sys/bus/platform/devices/smpro-errmon.*/error_other_c=
e|
> +		| Other's UE  | /sys/bus/platform/devices/smpro-errmon.*/error_other_u=
e|
> +		+-------------+-------------------------------------------------------=
--+
> +		UE: Uncorrect-able Error
> +		CE: Correct-able Error
> +
> +		See section 3.3 Ampere (Vendor-Specific) Error Record Formats,
> +		Altra Family RAS Supplement.
> +
> +
> +What:		/sys/bus/platform/devices/smpro-errmon.*/overflow_[core|mem|pcie|=
other]_[ce|ue]
> +KernelVersion:	5.18
> +Contact:	quan@os.amperecomputing.com
> +Description:
> +		(RO) Return the overflow status of each type HW error reported:
> +		  0      : No overflow
> +		  1      : There is an overflow and the oldest HW errors are dropped
> +
> +		The detail of each sysfs entries is as below:
> +		+-------------+-------------------------------------------------------=
----+
> +		|   Overflow  |                   Sysfs entry                         =
    |
> +		+-------------+-------------------------------------------------------=
----+
> +		| Core's CE   | /sys/bus/platform/devices/smpro-errmon.*/overflow_core=
_ce |
> +		| Core's UE   | /sys/bus/platform/devices/smpro-errmon.*/overflow_core=
_ue |
> +		| Memory's CE | /sys/bus/platform/devices/smpro-errmon.*/overflow_mem_=
ce  |
> +		| Memory's UE | /sys/bus/platform/devices/smpro-errmon.*/overflow_mem_=
ue  |
> +		| PCIe's CE   | /sys/bus/platform/devices/smpro-errmon.*/overflow_pcie=
_ce |
> +		| PCIe's UE   | /sys/bus/platform/devices/smpro-errmon.*/overflow_pcie=
_ue |
> +		| Other's CE  | /sys/bus/platform/devices/smpro-errmon.*/overflow_othe=
r_ce|
> +		| Other's UE  | /sys/bus/platform/devices/smpro-errmon.*/overflow_othe=
r_ue|
> +		+-------------+-------------------------------------------------------=
----+
> +		UE: Uncorrect-able Error
> +		CE: Correct-able Error
> +
> +What:           /sys/bus/platform/devices/smpro-errmon.*/[error|warn]_[s=
mpro|pmpro]
> +KernelVersion:	5.18
> +Contact:	quan@os.amperecomputing.com
> +Description:
> +		(RO) Contains the internal firmware error/warning printed as hex forma=
t.
> +
> +		The detail of each sysfs entries is as below:
> +		+---------------+-----------------------------------------------------=
-+
> +		|   Error       |                   Sysfs entry                       =
 |
> +		+---------------+-----------------------------------------------------=
-+
> +		| SMpro error   | /sys/bus/platform/devices/smpro-errmon.*/error_smpro=
 |
> +		| SMpro warning | /sys/bus/platform/devices/smpro-errmon.*/warn_smpro =
 |
> +		| PMpro error   | /sys/bus/platform/devices/smpro-errmon.*/error_pmpro=
 |
> +		| PMpro warning | /sys/bus/platform/devices/smpro-errmon.*/warn_pmpro =
 |
> +		+---------------+-----------------------------------------------------=
-+
> +		See more details in section 5.10 RAS Internal Error Register Definitio=
ns,
> +		Altra Family Soc BMC Interface Specification.
> +
> +What:           /sys/bus/platform/devices/smpro-errmon.*/event_[vrd_warn=
_fault|vrd_hot|dimm_hot]
> +KernelVersion:	5.18
> +Contact:	quan@os.amperecomputing.com
> +Description:
> +		(RO) Contains the detail information in case of VRD/DIMM warning/hot e=
vents
> +		in hex format as below:
> +
> +		AAAA
> +		Where:
> +		  AAAA: The event detail information data
> +
> +		See more details in section 5.7 GPI Status Registers,
> +		Altra Family Soc BMC Interface Specification.
> +
> +
> +What:		/sys/bus/platform/devices/smpro-misc.*/boot_progress
> +KernelVersion:	5.18
> +Contact:	quan@os.amperecomputing.com
> +Description:
> +		(RO) Contains the boot stages information in hex as format below:
> +
> +		AABBCCCCCCCC
> +		Where:
> +		  AA      : The boot stages
> +		              00: SMpro firmware booting
> +		              01: PMpro firmware booting
> +		              02: ATF BL1 firmware booting
> +		              03: DDR initialization
> +		              04: DDR training report status
> +		              05: ATF BL2 firmware booting
> +		              06: ATF BL31 firmware booting
> +		              07: ATF BL32 firmware booting
> +		              08: UEFI firmware booting
> +		              09: OS booting
> +		  BB      : Boot status
> +		              00: Not started
> +		              01: Started
> +		              02: Completed without error
> +		              03: Failed.
> +		  CCCCCCCC: Boot status information defined for each boot stages
> +
> +		See more details in section 5.11 Boot Stage Register Definitions,
> +		and section 6. Processor Boot Progress Codes, Altra Family Soc BMC
> +		Interface Specification.
> +
> +
> +What:           /sys/bus/platform/devices/smpro-misc*/soc_power_limit
> +KernelVersion:	5.18
> +Contact:	quan@os.amperecomputing.com
> +Description:
> +		(RW) Contains the desired SoC power limit in Watt.
> +		Writes to this sysfs set the desired SoC power limit (W).
> +		Reads from this register return the current SoC power limit (W).
> +		The value ranges:
> +		  Minimum: 120 W
> +		  Maximum: Socket TDP power

The documentation above produces htmldocs warnings:

Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro:71: WARNI=
NG: Unexpected indentation.
Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro:117: WARN=
ING: Unexpected indentation.
Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro:86: WARNI=
NG: Unexpected indentation.
Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro:86: WARNI=
NG: Definition list ends without a blank line; unexpected unindent.

I have applied the fixup (with fixes to technical references):

---- >8 ----

diff --git a/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-sm=
pro b/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro
index d8f82a06570d88..39cf222fb6510a 100644
--- a/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro
+++ b/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro
@@ -6,23 +6,32 @@ Description:
 		in hex format.
=20
 		The detail of each sysfs entries is as below:
+
 		+-------------+---------------------------------------------------------+
 		|   Error     |                   Sysfs entry                           |
 		+-------------+---------------------------------------------------------+
-		| Core's CE   | /sys/bus/platform/devices/smpro-errmon.*/error_core_ce |
-		| Core's UE   | /sys/bus/platform/devices/smpro-errmon.*/error_core_ue |
-		| Memory's CE | /sys/bus/platform/devices/smpro-errmon.*/error_mem_ce  |
-		| Memory's UE | /sys/bus/platform/devices/smpro-errmon.*/error_mem_ue  |
-		| PCIe's CE   | /sys/bus/platform/devices/smpro-errmon.*/error_pcie_ce |
-		| PCIe's UE   | /sys/bus/platform/devices/smpro-errmon.*/error_pcie_ue |
-		| Other's CE  | /sys/bus/platform/devices/smpro-errmon.*/error_other_ce|
-		| Other's UE  | /sys/bus/platform/devices/smpro-errmon.*/error_other_ue|
+		| Core's CE   | /sys/bus/platform/devices/smpro-errmon.*/error_core_ce  |
 		+-------------+---------------------------------------------------------+
+		| Core's UE   | /sys/bus/platform/devices/smpro-errmon.*/error_core_ue  |
+		+-------------+---------------------------------------------------------+
+		| Memory's CE | /sys/bus/platform/devices/smpro-errmon.*/error_mem_ce   |
+		+-------------+---------------------------------------------------------+
+		| Memory's UE | /sys/bus/platform/devices/smpro-errmon.*/error_mem_ue   |
+		+-------------+---------------------------------------------------------+
+		| PCIe's CE   | /sys/bus/platform/devices/smpro-errmon.*/error_pcie_ce  |
+		+-------------+---------------------------------------------------------+
+		| PCIe's UE   | /sys/bus/platform/devices/smpro-errmon.*/error_pcie_ue  |
+		+-------------+---------------------------------------------------------+
+		| Other's CE  | /sys/bus/platform/devices/smpro-errmon.*/error_other_ce |
+		+-------------+---------------------------------------------------------+
+		| Other's UE  | /sys/bus/platform/devices/smpro-errmon.*/error_other_ue |
+		+-------------+---------------------------------------------------------+
+
 		UE: Uncorrect-able Error
 		CE: Correct-able Error
=20
-		See section 3.3 Ampere (Vendor-Specific) Error Record Formats,
-		Altra Family RAS Supplement.
+		For details, see section `3.3 Ampere (Vendor-Specific) Error Record Form=
ats,
+		Altra Family RAS Supplement`.
=20
=20
 What:		/sys/bus/platform/devices/smpro-errmon.*/overflow_[core|mem|pcie|ot=
her]_[ce|ue]
@@ -30,24 +39,36 @@ KernelVersion:	5.18
 Contact:	quan@os.amperecomputing.com
 Description:
 		(RO) Return the overflow status of each type HW error reported:
-		  0      : No overflow
-		  1      : There is an overflow and the oldest HW errors are dropped
+
+		  - 0      : No overflow
+		  - 1      : There is an overflow and the oldest HW errors are dropped
=20
 		The detail of each sysfs entries is as below:
+
 		+-------------+---------------------------------------------------------=
--+
 		|   Overflow  |                   Sysfs entry                           =
  |
 		+-------------+---------------------------------------------------------=
--+
 		| Core's CE   | /sys/bus/platform/devices/smpro-errmon.*/overflow_core_c=
e |
+		+-------------+---------------------------------------------------------=
--+
 		| Core's UE   | /sys/bus/platform/devices/smpro-errmon.*/overflow_core_u=
e |
+		+-------------+---------------------------------------------------------=
--+
 		| Memory's CE | /sys/bus/platform/devices/smpro-errmon.*/overflow_mem_ce=
  |
+		+-------------+---------------------------------------------------------=
--+
 		| Memory's UE | /sys/bus/platform/devices/smpro-errmon.*/overflow_mem_ue=
  |
+		+-------------+---------------------------------------------------------=
--+
 		| PCIe's CE   | /sys/bus/platform/devices/smpro-errmon.*/overflow_pcie_c=
e |
+		+-------------+---------------------------------------------------------=
--+
 		| PCIe's UE   | /sys/bus/platform/devices/smpro-errmon.*/overflow_pcie_u=
e |
+		+-------------+---------------------------------------------------------=
--+
 		| Other's CE  | /sys/bus/platform/devices/smpro-errmon.*/overflow_other_=
ce|
+		+-------------+---------------------------------------------------------=
--+
 		| Other's UE  | /sys/bus/platform/devices/smpro-errmon.*/overflow_other_=
ue|
 		+-------------+---------------------------------------------------------=
--+
-		UE: Uncorrect-able Error
-		CE: Correct-able Error
+
+		where:
+
+		  - UE: Uncorrect-able Error
+		  - CE: Correct-able Error
=20
 What:           /sys/bus/platform/devices/smpro-errmon.*/[error|warn]_[smp=
ro|pmpro]
 KernelVersion:	5.18
@@ -56,61 +77,74 @@ Description:
 		(RO) Contains the internal firmware error/warning printed as hex format.
=20
 		The detail of each sysfs entries is as below:
+
 		+---------------+------------------------------------------------------+
 		|   Error       |                   Sysfs entry                        |
 		+---------------+------------------------------------------------------+
 		| SMpro error   | /sys/bus/platform/devices/smpro-errmon.*/error_smpro |
+		+---------------+------------------------------------------------------+
 		| SMpro warning | /sys/bus/platform/devices/smpro-errmon.*/warn_smpro  |
+		+---------------+------------------------------------------------------+
 		| PMpro error   | /sys/bus/platform/devices/smpro-errmon.*/error_pmpro |
+		+---------------+------------------------------------------------------+
 		| PMpro warning | /sys/bus/platform/devices/smpro-errmon.*/warn_pmpro  |
 		+---------------+------------------------------------------------------+
-		See more details in section 5.10 RAS Internal Error Register Definitions,
-		Altra Family Soc BMC Interface Specification.
+
+		For details, see section `5.10 RAS Internal Error Register Definitions,
+		Altra Family Soc BMC Interface Specification`.
=20
 What:           /sys/bus/platform/devices/smpro-errmon.*/event_[vrd_warn_f=
ault|vrd_hot|dimm_hot]
 KernelVersion:	5.18
 Contact:	quan@os.amperecomputing.com
 Description:
 		(RO) Contains the detail information in case of VRD/DIMM warning/hot eve=
nts
-		in hex format as below:
+		in hex format as below::
=20
-		AAAA
-		Where:
-		  AAAA: The event detail information data
+		    AAAA
=20
-		See more details in section 5.7 GPI Status Registers,
-		Altra Family Soc BMC Interface Specification.
+		where:
+
+		  - ``AAAA``: The event detail information data
+
+		For more details, see section `5.7 GPI Status Registers,
+		Altra Family Soc BMC Interface Specification`.
=20
=20
 What:		/sys/bus/platform/devices/smpro-misc.*/boot_progress
 KernelVersion:	5.18
 Contact:	quan@os.amperecomputing.com
 Description:
-		(RO) Contains the boot stages information in hex as format below:
+		(RO) Contains the boot stages information in hex as format below::
=20
-		AABBCCCCCCCC
-		Where:
-		  AA      : The boot stages
-		              00: SMpro firmware booting
-		              01: PMpro firmware booting
-		              02: ATF BL1 firmware booting
-		              03: DDR initialization
-		              04: DDR training report status
-		              05: ATF BL2 firmware booting
-		              06: ATF BL31 firmware booting
-		              07: ATF BL32 firmware booting
-		              08: UEFI firmware booting
-		              09: OS booting
-		  BB      : Boot status
-		              00: Not started
-		              01: Started
-		              02: Completed without error
-		              03: Failed.
-		  CCCCCCCC: Boot status information defined for each boot stages
+		    AABBCCCCCCCC
=20
-		See more details in section 5.11 Boot Stage Register Definitions,
-		and section 6. Processor Boot Progress Codes, Altra Family Soc BMC
-		Interface Specification.
+		where:
+
+		  - ``AA``      : The boot stages
+
+		    - 00: SMpro firmware booting
+		    - 01: PMpro firmware booting
+		    - 02: ATF BL1 firmware booting
+		    - 03: DDR initialization
+		    - 04: DDR training report status
+		    - 05: ATF BL2 firmware booting
+		    - 06: ATF BL31 firmware booting
+		    - 07: ATF BL32 firmware booting
+		    - 08: UEFI firmware booting
+		    - 09: OS booting
+
+		  - ``BB``      : Boot status
+
+		    - 00: Not started
+		    - 01: Started
+		    - 02: Completed without error
+		    - 03: Failed.
+
+		  - ``CCCCCCCC``: Boot status information defined for each boot stages
+
+		For details, see section `5.11 Boot Stage Register Definitions`
+		and section `6. Processor Boot Progress Codes, Altra Family Soc BMC
+		Interface Specification`.
=20
=20
 What:           /sys/bus/platform/devices/smpro-misc*/soc_power_limit
@@ -121,5 +155,6 @@ Description:
 		Writes to this sysfs set the desired SoC power limit (W).
 		Reads from this register return the current SoC power limit (W).
 		The value ranges:
-		  Minimum: 120 W
-		  Maximum: Socket TDP power
+
+		  - Minimum: 120 W
+		  - Maximum: Socket TDP power

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--kUsQPpaU0BXqgnpI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCYza4/wAKCRD2uYlJVVFO
o5svAQCSZ1OckshjdWjDv7dwUTOOGBgC0fNz9+j2TFy7QR45EwD9GvxlUDr42ysP
UJgWNqn/Qxi7jKVp1cTlGl86h+PwmQw=
=bzCY
-----END PGP SIGNATURE-----

--kUsQPpaU0BXqgnpI--
