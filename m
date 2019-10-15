Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E37D7D6D62
	for <lists+openbmc@lfdr.de>; Tue, 15 Oct 2019 04:58:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46sg8y3g9LzDqx5
	for <lists+openbmc@lfdr.de>; Tue, 15 Oct 2019 13:58:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com;
 envelope-from=karo33bug@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="GbuoIBbt"; 
 dkim-atps=neutral
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46sg8C6yTNzDqbh
 for <openbmc@lists.ozlabs.org>; Tue, 15 Oct 2019 13:57:26 +1100 (AEDT)
Received: by mail-lf1-x136.google.com with SMTP id w67so13242459lff.4
 for <openbmc@lists.ozlabs.org>; Mon, 14 Oct 2019 19:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=vfIsgSC3+lBMU1PHlynL3MQG590WAcbDHGtD/v3YmPU=;
 b=GbuoIBbtUV3urJ2CuYxWWsApyagnJsKX0ceX2jceIYKAA0Up3dcb/ivVTICJ0xzEBL
 aS1A4sv5Y2qOlyfwR6IbqvrjTcBr8vL3B3mdxPVwQduNP20yrFZbXMV56Gz4AZImyHQW
 0yx1EZ10O4CxMs4HYLpY1DtKhVMUFq0VG8FnbgHOwxsLje8Luq0MoSmQ812OUfiXIPwT
 hPv/0m45yYHjsjH0n4WQWx1a2E+rsemWuqIts9bAL7ub4WocFFNA19n1Y9Bp2zla/UwE
 czz+dpxfeVU4F3gnVdktAYz4zcNRDOKs6+KJwZ8ovL8ztB0+qYINEHVYo276ln9snPk5
 OUJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=vfIsgSC3+lBMU1PHlynL3MQG590WAcbDHGtD/v3YmPU=;
 b=MdWLcJG+bll2PMxruJajaivU81aCv2rqqX7JHm5M776CXjrOpKUo1QZb2xNosQi7Fl
 jI1N+Alu45giVpP9tMe0eat59ANI3LR8lZsd45p0EYztAgRwfo0UMe2i0vyvlwUrrCKr
 JPtZGSVEn/ezVjUfXAIFDLYVNezuu5J94Tc3BkVRHEbB5b2op7KKdu0j4eLUMYzaSeTH
 hrxVCyg54dDKAMh0mHLra3JlBRWEH0Yuz6J8mpC2oGSgkkXXuAo+JNesyJw+BJAzahkr
 LoqE9cG+qbwcHMjKl+shVEx5a4U/0OISQSdpJGIU0Tkn+vRgQ1zJIiYeP/ZbsxWiYMcB
 p7sQ==
X-Gm-Message-State: APjAAAWdcEnN5jiiAEJ/2MI1tZaGAXTEgGYYOh38tKtNJNOEY033EKsl
 1rttSKBv+7zJDOPOyxLUCnO9hc1+uZksN8Pv8690NzZKb8U=
X-Google-Smtp-Source: APXvYqy8MHkW3EVASd8+eubdrDeawTGaNPLk0syRuCrvBMKsypiwCOqcTT/8HKEsvv6hyKaHcV4sM4Dwb6zqpA/W6xg=
X-Received: by 2002:a05:6512:25b:: with SMTP id
 b27mr12361232lfo.146.1571108240671; 
 Mon, 14 Oct 2019 19:57:20 -0700 (PDT)
MIME-Version: 1.0
From: Carol Wang <karo33bug@gmail.com>
Date: Tue, 15 Oct 2019 10:57:09 +0800
Message-ID: <CALzeG+8HyS2xuBAoe4LN0XCC1+eW7D8uQnG9MKK=KGFN7jodZw@mail.gmail.com>
Subject: The type of sensor value in redfish should be double or int64?
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000096c9230594ea24b2"
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
Cc: gmills@linux.vnet.ibm.com, ed.tanous@intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000096c9230594ea24b2
Content-Type: text/plain; charset="UTF-8"

Hi,

I tried to override sensor values with redfish Patch, referring to the
Voltages example of
https://github.com/openbmc/bmcweb/search?q=413961de&type=Commits, but met
an error "Invalid argument". Comparing the code
https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/sensors.hpp#L2192
and the doc
https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Sensor/Value.interface.yaml#L21,
the current code uses double type, but the doc says the value type should
be int64. It seems a scale difference. Why the code uses double here?

Thanks!

--00000000000096c9230594ea24b2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>I tried to override sens=
or values with redfish Patch, referring to the Voltages example of <a href=
=3D"https://github.com/openbmc/bmcweb/search?q=3D413961de&amp;type=3DCommit=
s">https://github.com/openbmc/bmcweb/search?q=3D413961de&amp;type=3DCommits=
</a>, but met an error &quot;Invalid argument&quot;. Comparing the code <a =
href=3D"https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/sens=
ors.hpp#L2192">https://github.com/openbmc/bmcweb/blob/master/redfish-core/l=
ib/sensors.hpp#L2192</a> and the doc <a href=3D"https://github.com/openbmc/=
phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Sensor/Value.inter=
face.yaml#L21">https://github.com/openbmc/phosphor-dbus-interfaces/blob/mas=
ter/xyz/openbmc_project/Sensor/Value.interface.yaml#L21</a>, the current co=
de uses double type, but the doc says the value type should be int64. It se=
ems a scale difference. Why the code uses double here?</div><div><br></div>=
<div>Thanks!<br></div></div>

--00000000000096c9230594ea24b2--
