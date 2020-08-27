Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 43826254E82
	for <lists+openbmc@lfdr.de>; Thu, 27 Aug 2020 21:29:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bct8z5dflzDqld
	for <lists+openbmc@lfdr.de>; Fri, 28 Aug 2020 05:29:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=phoenix.com (client-ip=216.205.24.170;
 helo=us-smtp-delivery-170.mimecast.com;
 envelope-from=bruce_mitchell@phoenix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=phoenix.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=phoenix.com header.i=@phoenix.com header.a=rsa-sha256
 header.s=mimecast20170203 header.b=Bj0ohmsZ; 
 dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com
 header.a=rsa-sha256 header.s=mimecast20170203 header.b=u+DOENlO; 
 dkim-atps=neutral
X-Greylist: delayed 67 seconds by postgrey-1.36 at bilbo;
 Fri, 28 Aug 2020 05:29:03 AEST
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [216.205.24.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bct7z3Lw2zDqk7
 for <openbmc@lists.ozlabs.org>; Fri, 28 Aug 2020 05:29:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1598556538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=z4INrogTyTrMNhvctENi+7wlZQtAAyngx6+AJYKueww=;
 b=Bj0ohmsZfGW3A7SCFkoQBjCaauE5R3xjaghnuBdfDZUIkXiDOUuPYh3W2MaS9U2oniEDgl
 lWe1pHo20ouSttsMsMQzTv1Fh41OUyKV/rQPOa7uK/Rgf0Bp4mzFr5dQMCqAok+tk588Lr
 5+stqTzanBSV4OxbkutjenbWxk4/IVY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1598556539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=z4INrogTyTrMNhvctENi+7wlZQtAAyngx6+AJYKueww=;
 b=u+DOENlOEWTos1vvc2m0sn3kIIgWaKSuyoiFqLRKmbnnMdK28eY2igOeLxp3jJFBsVRjB4
 g9BQIsO4XyKyyJumgyG7itzlzq2PPn/LQ4a9kzmFC9Xqenf4qMy3Ufcv29awp0sWMqMdfM
 J2tRR/vY2vam6+9xIUNOVO9Rolau/Yk=
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-TiM8oGrrMby83QjoLEjZvQ-1; Thu, 27 Aug 2020 15:27:46 -0400
X-MC-Unique: TiM8oGrrMby83QjoLEjZvQ-1
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Thu, 27 Aug 2020 12:27:44 -0700
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Thu, 27 Aug 2020 12:27:44 -0700
From: Bruce Mitchell <Bruce_Mitchell@phoenix.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Is there any reason or practical value of staying with
 https://github.com/openbmc/openbmc/tree/2.8.0
Thread-Topic: Is there any reason or practical value of staying with
 https://github.com/openbmc/openbmc/tree/2.8.0
Thread-Index: AdZ8p+wPxEjbOFEZSPWdkMffOCnL1g==
Date: Thu, 27 Aug 2020 19:27:43 +0000
Message-ID: <fd8d46e97bc742b5b8dd9325f3835326@SCL-EXCHMB-13.phoenix.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [98.246.252.115]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: SCL-EXCHMB-13.phoenix.com
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA70A150 smtp.mailfrom=bruce_mitchell@phoenix.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: phoenix.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
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

Is there any reason or practical value of staying with https://github.com/o=
penbmc/openbmc/tree/2.8.0
vs just using https://github.com/openbmc/openbmc ?

Thanks!

--=20
Bruce

