Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 140F9A4CEE
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 02:53:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MBQt3PHmzDqP7
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 10:53:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=dhautefeuille.eu
 (client-ip=2001:bc8:327b:100::1; helo=arch-server.dhautefeuille.eu;
 envelope-from=gaspard@dhautefeuille.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=dhautefeuille.eu
X-Greylist: delayed 428 seconds by postgrey-1.36 at bilbo;
 Sat, 24 Aug 2019 21:45:13 AEST
Received: from arch-server.dhautefeuille.eu (arch-server.dhautefeuille.eu
 [IPv6:2001:bc8:327b:100::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46FxK55gJRzDrfT
 for <openbmc@lists.ozlabs.org>; Sat, 24 Aug 2019 21:45:12 +1000 (AEST)
Received: from [10.143.184.146] (92.40.248.142.threembb.co.uk [92.40.248.142])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: gaspard@dhautefeuille.eu)
 by arch-server.dhautefeuille.eu (Postfix) with ESMTPSA id 2A12721814ED
 for <openbmc@lists.ozlabs.org>; Sat, 24 Aug 2019 13:37:50 +0200 (CEST)
Authentication-Results: arch-server.dhautefeuille.eu;
 dmarc=fail (p=reject dis=none)
 header.from=dhautefeuille.eu
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=dhautefeuille.eu;
 s=mail; t=1566646670;
 bh=2B1nqokCA8L57AGdwMTpqWK90yVO2AIrc9c1mv5ouCc=;
 h=From:Date:Subject:To;
 b=irTv/NIZ0o6S5q8QjOmVB5eL5xQWfRtGBHHsYuhy9nfJzSxffsi0SzGLiZWd27F5n
 9QGeMHe0d67+bfmXKfCd6C8Bfk49kRYi86vc6klzRbgROBlKoxYjWDB3RZfsbEDedt
 D3+FReUdoWh1l4Y3M33VNg9Rc8gfb+BPn8i3+nDc=
From: =?utf-8?Q?Gaspard_d=E2=80=99Hautefeuille?= <gaspard@dhautefeuille.eu>
Content-Type: multipart/alternative;
 boundary=Apple-Mail-BD4E2593-04F2-49B2-8F7E-9868325BBCAB
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (1.0)
Date: Sat, 24 Aug 2019 12:37:35 +0100
Subject: KVM over IP switch running on OpenBMC
Message-Id: <24275FFD-28AE-455D-8B65-F2A25662D47F@dhautefeuille.eu>
To: openbmc@lists.ozlabs.org
X-Mailer: iPhone Mail (16F203)
X-Mailman-Approved-At: Mon, 02 Sep 2019 10:34:52 +1000
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Apple-Mail-BD4E2593-04F2-49B2-8F7E-9868325BBCAB
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

I know that OpenBMC has KVM over IP support since at least July 2019.

Wouldn=E2=80=99t that make sense to have a KVM over IP switch running on Ope=
nBMC and offering most of its features?

I have a Mac Mini 2018 running as a server, and I would prefer to have a sec=
ure KVM over IP switch using OpenBMC, bmcweb and TLS 1.3.

I don=E2=80=99t think OpenBMC aims to do that and have compatible KVM over I=
P switches.

Thanks,
HLFH=

--Apple-Mail-BD4E2593-04F2-49B2-8F7E-9868325BBCAB
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><p style=3D"margin: 0px; font-stretch: norm=
al; font-size: 12px; line-height: normal; font-family: Helvetica;"><span sty=
le=3D"font-size: 12pt;">Hi,</span></p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-height:=
 normal; font-family: Helvetica; min-height: 13.8px;"><span style=3D"font-si=
ze: 12pt;"></span><br></p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-height:=
 normal; font-family: Helvetica;"><span style=3D"font-size: 12pt;">I know th=
at OpenBMC has KVM over IP support since at least July 2019.</span></p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-height:=
 normal; font-family: Helvetica; min-height: 13.8px;"><span style=3D"font-si=
ze: 12pt;"></span><br></p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-height:=
 normal; font-family: Helvetica;"><span style=3D"font-size: 12pt;">Wouldn=E2=
=80=99t that make sense to have a KVM over IP switch running on OpenBMC and o=
ffering most of its features?</span></p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-height:=
 normal; font-family: Helvetica; min-height: 13.8px;"><span style=3D"font-si=
ze: 12pt;"></span><br></p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-height:=
 normal; font-family: Helvetica;"><span style=3D"font-size: 12pt;">I have a M=
ac Mini 2018 running as a server, and I would prefer to have a secure KVM ov=
er IP switch using OpenBMC, bmcweb and TLS 1.3.</span></p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-height:=
 normal; font-family: Helvetica; min-height: 13.8px;"><span style=3D"font-si=
ze: 12pt;"></span><br></p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-height:=
 normal; font-family: Helvetica;"><span style=3D"font-size: 12pt;">I don=E2=80=
=99t think OpenBMC aims to do that and have compatible KVM over IP switches.=
</span></p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-height:=
 normal; font-family: Helvetica; min-height: 13.8px;"><span style=3D"font-si=
ze: 12pt;"></span><br></p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-height:=
 normal; font-family: Helvetica;"><span style=3D"font-size: 12pt;">Thanks,</=
span></p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 12px; line-height:=
 normal; font-family: Helvetica;"><span style=3D"font-size: 12pt;">HLFH</spa=
n></p></body></html>=

--Apple-Mail-BD4E2593-04F2-49B2-8F7E-9868325BBCAB--
