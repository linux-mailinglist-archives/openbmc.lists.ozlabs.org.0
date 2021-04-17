Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F66362C69
	for <lists+openbmc@lfdr.de>; Sat, 17 Apr 2021 02:24:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FMYjf0Bxmz3brT
	for <lists+openbmc@lfdr.de>; Sat, 17 Apr 2021 10:24:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=Zw4CM3C4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::32f;
 helo=mail-ot1-x32f.google.com; envelope-from=ztai@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=Zw4CM3C4; dkim-atps=neutral
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FMYjQ1T5Dz3bpb
 for <openbmc@lists.ozlabs.org>; Sat, 17 Apr 2021 10:24:07 +1000 (AEST)
Received: by mail-ot1-x32f.google.com with SMTP id
 o13-20020a9d404d0000b029028e0a0ae6b4so8254136oti.10
 for <openbmc@lists.ozlabs.org>; Fri, 16 Apr 2021 17:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=LXXsr0B1s9fV+H+93PVy7/W/FWVzPYkJYgazSYGJq5c=;
 b=Zw4CM3C4xe+m4aAHOwRtbsaC3REgAOt/YLlpm1imu7ALc5je4TlLxCtmAQtesJVgoG
 ZVq5Bi+ENntCJjZk8Kyb01MZzf9GKJh4C0V0336+2sySAVJVC+j2Gnp/7VoI9Qkoh69X
 jF8LZwmW/eQPCQ8PKfWMxFmH8PYyz2z1/JinrUK/jYdyIhB8+a7y5UYeIaLNYXmxOJmv
 LoLmasCx/bVHyIzMVGryD7QnfErFoUs9nceJRCkoVABhPOODomCX8YzFqTQPPEzTDf3I
 B6KQL3t3dgpilySldkKSc57MIx8hcAcgrwz+UO3znjlner2B7wMVIHsFgxo+2T4YzhFM
 tKSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=LXXsr0B1s9fV+H+93PVy7/W/FWVzPYkJYgazSYGJq5c=;
 b=FaUtUEAF9twR+4Ns0gQb1Ma+rKCCodfTo7COzaDkv41+G7NC5zwVgmaWwGhK6L9XSk
 ciLmqcsyDeifYaEdDmWps9PfQBm6P+QSnXmJzG9rKLepefCX8GuWlTyDNVcxUxU7bJoi
 2CzQ6OXHocOA+OR8L94DKRuGgGVWtY5LDm/eByehYbtWPSm6cRF7ylr9m66isZnqFuCu
 HLlLFWydphu70FRuDtpowF+aq1yz16ck+vU8xvkLnqY6hAaS+FH1H0WfOwzLcbeyaH+5
 cD1+FLX5EIxcXpkVGdLtsvihhKuRSmeAVCPn3mmfo4zEfeuT/vZXwxYpIWgBdkPmwQsy
 nYjw==
X-Gm-Message-State: AOAM532pp0gBhc+ylJ6d9/yfyh2P7tqKCn51YIHWQ3ByAzQZYA+vqWXS
 qpJI9KPJmzNpV/5sfa8XUwn/OqZOv3kvZUQWt68fpd6jw5H5Y13m
X-Google-Smtp-Source: ABdhPJzb/FwujeSLVBtdmslYgSPoRgUZuP8iE64VnZL7SxvFfXxomKdjfipigK/D1L5skHeeFRe306CE6jKXH5u7ozo=
X-Received: by 2002:a05:6830:22f9:: with SMTP id
 t25mr5678468otc.174.1618619044169; 
 Fri, 16 Apr 2021 17:24:04 -0700 (PDT)
MIME-Version: 1.0
From: Zhenfei Tai <ztai@google.com>
Date: Fri, 16 Apr 2021 17:23:52 -0700
Message-ID: <CAMXw96PmAoSb5LJj-CzYA-47D-nCy81gBa=T94N_u2fqWL54EQ@mail.gmail.com>
Subject: bmcweb: Install encrypted certificate to BMC
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Ed Tanous <edtanous@google.com>, gmills@us.ibm.com
Content-Type: multipart/alternative; boundary="00000000000027f30005c0201d34"
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
Cc: Justin Chen <juschen@google.com>, Richard Hanley <rhanley@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000027f30005c0201d34
Content-Type: text/plain; charset="UTF-8"

Hi,

Currently certificate installation is supported by bmcweb via
*redfish/v1/Managers/bmc/Truststore/Certificates*, where the certificate
content is part of the JSON request.

For our use case it's a more restricted environment in which we don't want
to have plaintext certificates in the request. Instead we want to send a
pair of encrypted key and certificate from the host to the BMC and there
will be another daemon to decrypt them using an internal library.

Since it's not supported by the Redfish schema, my plan is to use the
*redfish/v1/CertificateSerivce/OemActions* URI and a request payload like
below:
{
  "key": "encrypted key in binary",
  "certificate": "encrypted certificate in binary"
}

The reasons to use the URI and payload are:
1. It's related to certificate service although in opaque blobs.
2. It's fairly company specific that probably isn't universally applicable.

My questions are:
1. Is this a reasonable approach?
2. Shall we define an OEM schema for our request?

Thanks,
Zhenfei

--00000000000027f30005c0201d34
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><div><br></div><div>Currently certificate installat=
ion is supported by bmcweb via=C2=A0<i>redfish/v1/Managers/bmc/Truststore/C=
ertificates</i>, where the certificate content is part of the JSON request.=
</div><div><br></div><div>For our use case it&#39;s a more restricted envir=
onment in which we don&#39;t want to have plaintext certificates in the req=
uest. Instead we want to send a pair of encrypted key and certificate=C2=A0=
from the host to the BMC and there will be another daemon to decrypt them u=
sing an internal library.</div><div><br></div><div>Since it&#39;s not suppo=
rted by the Redfish schema, my plan is to use the <i>redfish/v1/Certificate=
Serivce/OemActions</i>=C2=A0URI and a request payload like below:</div><div=
>{</div><div>=C2=A0 &quot;key&quot;: &quot;encrypted key in binary&quot;,</=
div><div>=C2=A0 &quot;certificate&quot;: &quot;encrypted certificate in bin=
ary&quot;</div><div>}</div><div><br></div><div>The reasons to=C2=A0use the =
URI and payload are:</div><div>1. It&#39;s related to certificate=C2=A0serv=
ice although in opaque blobs. </div><div>2. It&#39;s fairly company specifi=
c that probably isn&#39;t universally applicable.</div><div><br></div><div>=
My questions are:<br>1. Is this a reasonable approach?</div><div>2. Shall w=
e define an OEM schema for our request?</div><div><br></div><div>Thanks,</d=
iv><div>Zhenfei</div><div><br></div><div><br></div></div>

--00000000000027f30005c0201d34--
