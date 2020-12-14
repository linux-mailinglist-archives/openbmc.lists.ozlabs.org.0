Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2981B2DA374
	for <lists+openbmc@lfdr.de>; Mon, 14 Dec 2020 23:34:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cvx5l4WhhzDqPl
	for <lists+openbmc@lfdr.de>; Tue, 15 Dec 2020 09:34:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=phoenix.com (client-ip=63.128.21.170;
 helo=us-smtp-delivery-170.mimecast.com;
 envelope-from=patrick_voelker@phoenix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=phoenix.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=phoenix.com header.i=@phoenix.com header.a=rsa-sha256
 header.s=mimecast20170203 header.b=D38MLLBa; 
 dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com
 header.a=rsa-sha256 header.s=mimecast20170203 header.b=gO6kB69u; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [63.128.21.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cvx4n3PhWzDqNC
 for <openbmc@lists.ozlabs.org>; Tue, 15 Dec 2020 09:33:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1607985217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=boc3i3spVcVDXDUPTKkCErKFAUUlSwWH9MAUoqTJsi4=;
 b=D38MLLBa1UHnUCKu6tXwbNvpI6D3WhZwrw3t30iPbxg6Xznt7FZwbZk1zq9Ipsx8BVcF9i
 nTIJFd7R7Bl5/Y2sDHYjBhrud9J2rxP8vHTcsPKONU9DHPVBezGVXTvdAK3hhOtOwbEs8a
 iiFo77BcBRdcHAow8Xf1mpKQMLO2ay4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1607985218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=boc3i3spVcVDXDUPTKkCErKFAUUlSwWH9MAUoqTJsi4=;
 b=gO6kB69uI5Ey0eu5hV5U6sWV8d1w5nb1IMqKQnHWjhBUeEfKrFyMsIaM9J7yf2BDBAC/RU
 Pn85owfJ3Vfg8Gegy7wtimDVjhdHbaG3Vu1PGhvabVUzC3N2y/odMb5EjnZcdccHQmTizM
 O7QppMG81TvCDw4MkHUvm0uMIAW9Wnk=
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-SVEoog92PeybMrn19ONlow-1; Mon, 14 Dec 2020 17:33:35 -0500
X-MC-Unique: SVEoog92PeybMrn19ONlow-1
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Mon, 14 Dec 2020 14:33:32 -0800
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Mon, 14 Dec 2020 14:33:32 -0800
From: Patrick Voelker <Patrick_Voelker@phoenix.com>
To: "OpenBMC (openbmc@lists.ozlabs.org)" <openbmc@lists.ozlabs.org>
Subject: External interface for SNMP configuration
Thread-Topic: External interface for SNMP configuration
Thread-Index: AdbSZtaZM71USNHeStadOBKkRJHrGQ==
Date: Mon, 14 Dec 2020 22:33:32 +0000
Message-ID: <0ad15fe63a1346c4a2c1f16b7f791b8a@SCL-EXCHMB-13.phoenix.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [50.39.164.179]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: SCL-EXCHMB-13.phoenix.com
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA70A150 smtp.mailfrom=patrick_voelker@phoenix.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: phoenix.com
Content-Type: multipart/alternative; boundary="MCBoundary=_12012141733361261"
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

--MCBoundary=_12012141733361261
Content-Language: en-US
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

We've switched over to using webui-vue and I'm evaluating SNMP configuratio=
n support.  According to the webui-vue issues list, the redfish portion is =
not implemented yet.  I tried the old REST interface and am just getting "N=
ot Found" in return.  Haven't found any relevant IPMI commands.

Is there any external interface that I can use in the meantime while waitin=
g for the new support?

--MCBoundary=_12012141733361261
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=WINDOWS-1252

<HTML><BODY>We've switched over to using webui-vue and I'm evaluating SNMP =
configuration support.  According to the webui-vue issues list, the redfish=
 portion is not implemented yet.  I tried the old REST interface and am jus=
t getting &quot;Not Found&quot; in return.  Haven't found any relevant IPMI=
 commands.<BR>
<BR>
Is there any external interface that I can use in the meantime while waitin=
g for the new support?<BR>
</BODY></HTML>

--MCBoundary=_12012141733361261--

