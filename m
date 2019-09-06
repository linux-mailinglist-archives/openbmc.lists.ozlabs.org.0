Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D16ABF20
	for <lists+openbmc@lfdr.de>; Fri,  6 Sep 2019 20:06:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Q59F2lPzzDrDn
	for <lists+openbmc@lfdr.de>; Sat,  7 Sep 2019 04:06:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::732; helo=mail-qk1-x732.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="UT2HyJJD"; 
 dkim-atps=neutral
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Q58Y1ytSzDrB4
 for <openbmc@lists.ozlabs.org>; Sat,  7 Sep 2019 04:06:02 +1000 (AEST)
Received: by mail-qk1-x732.google.com with SMTP id x134so6538767qkb.0
 for <openbmc@lists.ozlabs.org>; Fri, 06 Sep 2019 11:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=CySawPcTztsgO8nIZRMTHxLqpTYIIc+uNAUGuJISdn0=;
 b=UT2HyJJDr9Qf2yR7yNMBLyzaFQsAtlMht3qjQX1IJXym2INwbxPqu/+7+VBSIUF7FR
 PvOH5MdpV2uc8WPAzwAgqvfXDjle3jRXZOKjl4moWI3D867j4t17NBr6lLFrc96lcTPa
 F0EsoohL9keSL7Agx8xX0pjpd70WxeTyS9sNU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=CySawPcTztsgO8nIZRMTHxLqpTYIIc+uNAUGuJISdn0=;
 b=rPbvCMa/h6OdC/VHF3lKTKE+bUkLsb6/p36X1UoDsjsGVWVfNmpyAT2KD6GfaetNlR
 cFmaA2ykwPS+o64Cl4Zqh9sVoevynzKaj4kFeyIAG/Av8StTLm3HTLAlFs94HfrfmTLE
 KH9wAtxy2Odku8WkaF2MMimzwMzQfFQEkat5tM5CIr1LK4Ie7zAq10ZzalO8hjKJhAtO
 mGu9Bz8EoSYec0x3s4DP5XB1NfWDIS1tS5kBcIm5BYoPZVvR0MZ0vn3ePOei1Mv5lWPc
 R2VqRc60x3e5HsOaM+Tx+B0zg/OV+vpcn5jX5w2IvqPRJnsmQ2SBxuyLrNaxokOFnCRm
 Nn8w==
X-Gm-Message-State: APjAAAWJbiIfKwLCSnX5/ZgMr9l2eh2TpbwFNrq9ESkj2ecSsJtbdG4C
 sut4Vjzb4QNeXftsXRc7Pe1XsM5dLJ0V753MBTEWOQ==
X-Google-Smtp-Source: APXvYqzqh9p/XFtshmoru95DvqhroiUgXA5KiG5psljj41OmZF+GZvhFmrzO7zrgmXWPcJ84SCf/FN+mbL2+qH1iblk=
X-Received: by 2002:a37:4a54:: with SMTP id x81mr10262035qka.292.1567793158032; 
 Fri, 06 Sep 2019 11:05:58 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 6 Sep 2019 18:05:46 +0000
Message-ID: <CACPK8XdHwwQwc8-5uf319tX7v3Uh7CcG1rLRmTEK9oKQPYS0hw@mail.gmail.com>
Subject: GPIO state in qemu
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000004413bc0591e64ae9"
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
Cc: Rashmica Gupta <rashmica.g@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000004413bc0591e64ae9
Content-Type: text/plain; charset="UTF-8"

At the osfc hackathon today James and I were talking about Qemu's new
support for modelling GPIOs. Here's some documentation on how it can be
used.

To set a pin's state in the monitor:

qom-set gpio gpioA0 true

To do the equivalent in code:

object_property_set_bool(OBJECT(&s->gpio), true, "gpioA0", &error_abort);

Thanks Rashmica for writing the model and Cedric for the tips.

Cheers,

Joel

--0000000000004413bc0591e64ae9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"auto">At the osfc hackathon today James and I =
were talking about Qemu&#39;s new support for modelling GPIOs. Here&#39;s s=
ome documentation on how it can be used.<div dir=3D"auto"><br></div><div di=
r=3D"auto">To set a pin&#39;s state in the monitor:</div><div dir=3D"auto">=
<br></div><div dir=3D"auto">qom-set gpio gpioA0 true<br></div><div dir=3D"a=
uto"><br></div><div dir=3D"auto">To do the equivalent in code:</div><div di=
r=3D"auto"><br></div><div dir=3D"auto">object_property_set_bool(OBJECT(&amp=
;s-&gt;gpio), true, &quot;gpioA0&quot;, &amp;error_abort);<br></div><div di=
r=3D"auto"><br></div><div dir=3D"auto">Thanks Rashmica for writing the mode=
l and Cedric for the tips.</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">Cheers,</div><div dir=3D"auto"><br></div><div dir=3D"auto">Joel</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto"><br></div></div>
</div>

--0000000000004413bc0591e64ae9--
