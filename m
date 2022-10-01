Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF235F297D
	for <lists+openbmc@lfdr.de>; Mon,  3 Oct 2022 09:20:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mgsg70qN1z3bkR
	for <lists+openbmc@lfdr.de>; Mon,  3 Oct 2022 18:20:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mwHdTkcA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=bagasdotme@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mwHdTkcA;
	dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MfYZJ5NJWz30Dp
	for <openbmc@lists.ozlabs.org>; Sat,  1 Oct 2022 14:11:35 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id x1so5507269plv.5
        for <openbmc@lists.ozlabs.org>; Fri, 30 Sep 2022 21:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=OSv7SDIGCVEG314+BzEZq4WXeWqQBm4mHIqqx0BP8u0=;
        b=mwHdTkcA1tHAUfCcwsrvYGERtpdrG4RMnvKmYCTjX15LrwOYgVEtmVMbfqrVfhHakj
         7g4ftx6CetZsFng+iOI1q36bEhi9Cp6b2zzqkzRWHV0xA/3d4eEvRddPSJcnKPwVanr2
         z7Om/zQ0sB4VC0OZPjqGhbysth6zx37my4dFgOuPoi0Iwq4CiW+z5OWZR8BNvEY2q7nC
         cCubav/qpG+PQN5ZHd+r4w4QLSZwxmiP21gxbAz70sgvgjeoeRgqhr+cTjmmTgN4qIzm
         5sjs9soqW4ai993zQIP0ylhAJ4NcBgB/S6pJ6pYDA8iWLrmemXGwQGRLPgj4lTRHCcM9
         VwuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=OSv7SDIGCVEG314+BzEZq4WXeWqQBm4mHIqqx0BP8u0=;
        b=BnaUr0ZQXzIk5nUYi1j0Qy4SRRdd3Z2UpNNbAExFIDQrwoNezjHlL3QyjLgdy976tZ
         TKGd7cTFlBZc4C8P5dvNy60a9vfborW0fAGjuIq7+BvUbqpQAV6VkENdoKxkMnjFDxkL
         sl3znSrLgyykLgowfRd3Qz6CWpdbTVeUsUTCJf0fDDw3/Gw2phAu2sHg/2Er2noaqJVZ
         OILcxg4J3U3d7CybUJSZXeDjg4bMMM6p1leT8cKBHrJCa/KRlsnDTsLCUSF+hxRA0sQv
         ULg7XtxLEXVVjhut+teTaOKb0gYC+G+Y+G8AEilGDC3V/BJyCQTJ0n7SWd4aFbW9eVqo
         xm8w==
X-Gm-Message-State: ACrzQf38hPiUeQPnbYJUcW1zAyBzoLEjA04A9urcaRwevBRHQtmNreMx
	+ninMH5cBCAcrEFXHxjCBMc=
X-Google-Smtp-Source: AMsMyM7bN9tAhIY4k9a7/S9pez9PmFy400BkzIrhaakxm4+6Obe+6Nd6DZjTA5R0T/f/fCPIEXJ/tQ==
X-Received: by 2002:a17:902:a707:b0:178:bd1e:e8be with SMTP id w7-20020a170902a70700b00178bd1ee8bemr11997820plq.167.1664597493786;
        Fri, 30 Sep 2022 21:11:33 -0700 (PDT)
Received: from debian.me (subs02-180-214-232-5.three.co.id. [180.214.232.5])
        by smtp.gmail.com with ESMTPSA id z186-20020a6265c3000000b0055fc0a132aasm175757pfb.92.2022.09.30.21.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 21:11:32 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 831731005BB; Sat,  1 Oct 2022 11:11:29 +0700 (WIB)
Date: Sat, 1 Oct 2022 11:11:28 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH v9 6/9] docs: misc-devices: (smpro-misc) Add documentation
Message-ID: <Yze98CgmGuNA0uGr@debian.me>
References: <20220929094321.770125-1-quan@os.amperecomputing.com>
 <20220929094321.770125-7-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zsOt5hDHQ+A0q34n"
Content-Disposition: inline
In-Reply-To: <20220929094321.770125-7-quan@os.amperecomputing.com>
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


--zsOt5hDHQ+A0q34n
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 29, 2022 at 04:43:18PM +0700, Quan Nguyen wrote:
> Adds documentation for the Ampere(R)'s Altra(R) SMpro misc driver.
>=20

s/Adds/Add/

> Signed-off-by: Thu Nguyen <thu@os.amperecomputing.com>
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>

Does this patch originally authored by Thu? If so, add From: line before
the patch description.

> diff --git a/Documentation/misc-devices/index.rst b/Documentation/misc-de=
vices/index.rst
> index b74b3b34a235..b40cd1b402f7 100644
> --- a/Documentation/misc-devices/index.rst
> +++ b/Documentation/misc-devices/index.rst
> @@ -28,6 +28,7 @@ fit into other categories.
>     oxsemi-tornado
>     pci-endpoint-test
>     smpro-errmon
> +   smpro-misc
>     spear-pcie-gadget
>     uacce
>     xilinx_sdfec
> diff --git a/Documentation/misc-devices/smpro-misc.rst b/Documentation/mi=
sc-devices/smpro-misc.rst
> new file mode 100644
> index 000000000000..d21be4a09e69
> --- /dev/null
> +++ b/Documentation/misc-devices/smpro-misc.rst
> @@ -0,0 +1,82 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +Kernel driver Ampere(R) Altra(R) SMpro miscellaneous
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +
> +Supported chips:
> +
> +  * Ampere(R) Altra(R)
> +
> +    Prefix: 'smpro'
> +
> +    Reference: Altra SoC BMC Interface Specification
> +
> +Author: Thu Nguyen <thu@os.amperecomputing.com>
> +
> +Description
> +-----------
> +
> +This driver support the monitoring and configuration of various miscella=
neous
> +data provided by Ampere(R) Altra(R) SMpro processor.
> +At this time, these include:
> +
> +  * Reading Boot Progress information
> +  * Configuring SoC Power Limit
> +
> +Sysfs entries
> +-------------
> +
> +1) Boot progress
> +
> +SMpro misc driver creates the sysfs files ``boot_progress``.
> +The format of ``boot_progress`` file is as below::
> +
> +<boot stage><boot status><boot progress>
> +
> +Where:
> +
> +* Boot stage::
> +
> +    0: SMpro firmware booting.
> +    1: PMpro firmware booting.
> +    2: ATF BL1 firmware booting.
> +    3: DDR initialization.
> +    4: DDR training report status.
> +    5: ATF BL2 firmware booting.
> +    6: ATF BL31 firmware booting.
> +    7: ATF BL32 firmware booting.
> +    8: UEFI firmware booting.
> +    9: OS booting.
> +
> +* Boot status::
> +
> +    0: Not started.
> +    1: Started.
> +    2: Complete without error.
> +    3: Failure.
> +
> +* boot progress: 32 bits boot progress code
> +
> +The sysfs ``boot_progress`` only reports the boot state when the host is=
 booting.
> +If the host is already booted, it returns latest state.
> +
> +Example::
> +
> +    #cat boot_progress
> +    0102808454A8
> +
> +2) SoC Power Limit
> +
> +SMpro misc driver creates the sysfs file ``soc_power_limit`` to get/set =
the SoC Power Limit.
> +
> +Reading this sysfs return the current setting of SoC Power Limit (W) in =
decimal string.
> +Writing the desired value in decimal string to set the SoC Power Limit i=
n Watt (W).
> +The range of SoC Power Limit is 90-500(W) and will be ignored if out of =
range.
> +
> +Example::
> +
> +    #cat soc_power_limit
> +    90
> +    #echo 95 > soc_power_limit
> +    #cat soc_power_limit
> +    95

The documentation above can be improved (both grammatical and
formatting):

---- >8 ----

diff --git a/Documentation/misc-devices/smpro-misc.rst b/Documentation/misc=
-devices/smpro-misc.rst
index d21be4a09e69c4..f33466152ac402 100644
--- a/Documentation/misc-devices/smpro-misc.rst
+++ b/Documentation/misc-devices/smpro-misc.rst
@@ -7,76 +7,77 @@ Supported chips:
=20
   * Ampere(R) Altra(R)
=20
-    Prefix: 'smpro'
+    Prefix: ``smpro``
=20
-    Reference: Altra SoC BMC Interface Specification
+    Reference: `Altra SoC BMC Interface Specification`
=20
 Author: Thu Nguyen <thu@os.amperecomputing.com>
=20
 Description
 -----------
=20
-This driver support the monitoring and configuration of various miscellane=
ous
-data provided by Ampere(R) Altra(R) SMpro processor.
-At this time, these include:
+The smpro-misc driver supports monitoring and configuration of various
+miscellaneous data provided by Ampere(R) Altra(R) SMpro processor.
+Currently, the driver supports:
=20
-  * Reading Boot Progress information
-  * Configuring SoC Power Limit
+  * reading boot progress information
+  * configuring SoC power limit
=20
 Sysfs entries
 -------------
=20
 1) Boot progress
=20
-SMpro misc driver creates the sysfs files ``boot_progress``.
-The format of ``boot_progress`` file is as below::
+   The driver creates ``boot_progress`` sysfs file. Its format is described
+   as::
=20
-<boot stage><boot status><boot progress>
+     <boot stage><boot status><boot progress>
=20
-Where:
+   where:
=20
-* Boot stage::
+   * ``<boot stage>`` can be:
=20
-    0: SMpro firmware booting.
-    1: PMpro firmware booting.
-    2: ATF BL1 firmware booting.
-    3: DDR initialization.
-    4: DDR training report status.
-    5: ATF BL2 firmware booting.
-    6: ATF BL31 firmware booting.
-    7: ATF BL32 firmware booting.
-    8: UEFI firmware booting.
-    9: OS booting.
+     * 0: SMpro firmware booting.
+     * 1: PMpro firmware booting.
+     * 2: ATF BL1 firmware booting.
+     * 3: DDR initialization.
+     * 4: DDR training report status.
+     * 5: ATF BL2 firmware booting.
+     * 6: ATF BL31 firmware booting.
+     * 7: ATF BL32 firmware booting.
+     * 8: UEFI firmware booting.
+     * 9: OS booting.
=20
-* Boot status::
+  * ``<boot status>`` can be:
=20
-    0: Not started.
-    1: Started.
-    2: Complete without error.
-    3: Failure.
+     * 0: Not started.
+     * 1: Started.
+     * 2: Complete without error.
+     * 3: Failure.
=20
-* boot progress: 32 bits boot progress code
+  * ``<boot progress>``: 32-bit boot progress code
=20
-The sysfs ``boot_progress`` only reports the boot state when the host is b=
ooting.
-If the host is already booted, it returns latest state.
+  The sysfs file  only reports the boot state when the host is booting. If
+  the host is already booted, it returns the latest state.
=20
-Example::
+  Example::
=20
     #cat boot_progress
     0102808454A8
=20
-2) SoC Power Limit
+2) SoC power limit
=20
-SMpro misc driver creates the sysfs file ``soc_power_limit`` to get/set th=
e SoC Power Limit.
+   The driver creates ``soc_power_limit`` sysfs file to get/set the SoC
+   power limit.
=20
-Reading this sysfs return the current setting of SoC Power Limit (W) in de=
cimal string.
-Writing the desired value in decimal string to set the SoC Power Limit in =
Watt (W).
-The range of SoC Power Limit is 90-500(W) and will be ignored if out of ra=
nge.
+   Reading the file returns the current limit. Write the desired value in
+   decimal to set the limit (in watts).  The valid limit range is 90-500 W.
+   If the value is out of range, it will be ignored.
=20
-Example::
+   Example::
=20
-    #cat soc_power_limit
-    90
-    #echo 95 > soc_power_limit
-    #cat soc_power_limit
-    95
+     #cat soc_power_limit
+     90
+     #echo 95 > soc_power_limit
+     #cat soc_power_limit
+     95

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--zsOt5hDHQ+A0q34n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCYze96AAKCRD2uYlJVVFO
owcpAP0SzTkhr29W2c7tfiTwIYHWalYjmZY5EzVRjxQmi/J9sAD/WNg/Verj9bSP
Po+V7JVmI96xpkLGdOLqpermfOky3Q8=
=qEoH
-----END PGP SIGNATURE-----

--zsOt5hDHQ+A0q34n--
