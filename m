Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B7B34DCD7
	for <lists+openbmc@lfdr.de>; Tue, 30 Mar 2021 02:12:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8VJK5tVtz303C
	for <lists+openbmc@lfdr.de>; Tue, 30 Mar 2021 11:12:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=phoenix.com header.i=@phoenix.com header.a=rsa-sha256 header.s=mimecast20170203 header.b=TIMMxVnq;
	dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com header.a=rsa-sha256 header.s=mimecast20170203 header.b=TIMMxVnq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=phoenix.com (client-ip=216.205.24.170;
 helo=us-smtp-delivery-170.mimecast.com;
 envelope-from=patrick_voelker@phoenix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=phoenix.com header.i=@phoenix.com header.a=rsa-sha256
 header.s=mimecast20170203 header.b=TIMMxVnq; 
 dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com
 header.a=rsa-sha256 header.s=mimecast20170203 header.b=TIMMxVnq; 
 dkim-atps=neutral
X-Greylist: delayed 67 seconds by postgrey-1.36 at boromir;
 Tue, 30 Mar 2021 11:12:20 AEDT
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [216.205.24.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8VJ40X1Fz2yj0
 for <openbmc@lists.ozlabs.org>; Tue, 30 Mar 2021 11:12:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1617063137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=h2v0ftUDiuMDX9SL70KRqT8gZEV6wAjRK2uhbGW7qlo=;
 b=TIMMxVnqgpSS9cwBRY0rQlpD5SyT8qb48QNaCYYwsc7h1RCQrAOlj0E5t7GgIeaoQdn55U
 RkD+i/vmrMvdjU/C8ulZ8dlggMsNqz8mICYoBAPItnXKUaO/1sdgsSXlUeFqcZzlbxmNzv
 2+60uGinIR6PAdUmA4NiOLFqPs4GVtA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1617063137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=h2v0ftUDiuMDX9SL70KRqT8gZEV6wAjRK2uhbGW7qlo=;
 b=TIMMxVnqgpSS9cwBRY0rQlpD5SyT8qb48QNaCYYwsc7h1RCQrAOlj0E5t7GgIeaoQdn55U
 RkD+i/vmrMvdjU/C8ulZ8dlggMsNqz8mICYoBAPItnXKUaO/1sdgsSXlUeFqcZzlbxmNzv
 2+60uGinIR6PAdUmA4NiOLFqPs4GVtA=
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-zFDQ8jYQMIe_pzHZDOOo5A-1; Mon, 29 Mar 2021 20:11:02 -0400
X-MC-Unique: zFDQ8jYQMIe_pzHZDOOo5A-1
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Mar 2021 17:11:00 -0700
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1497.012; Mon, 29 Mar 2021 17:10:59 -0700
From: Patrick Voelker <Patrick_Voelker@phoenix.com>
To: "OpenBMC (openbmc@lists.ozlabs.org)" <openbmc@lists.ozlabs.org>
Subject: Power state change watch in ControlStore.js
Thread-Topic: Power state change watch in ControlStore.js
Thread-Index: Adck+SkI3g+qaJHYSDyOKTb6+oqMuQ==
Date: Tue, 30 Mar 2021 00:10:59 +0000
Message-ID: <6d8c43a4f7f04db58d6ce32c61bfe148@SCL-EXCHMB-13.phoenix.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.122.68.195]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: SCL-EXCHMB-13.phoenix.com
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA70A150 smtp.mailfrom=patrick_voelker@phoenix.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: phoenix.com
Content-Type: multipart/alternative; boundary="MCBoundary=_12103292011040561"
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

--MCBoundary=_12103292011040561
Content-Language: en-US
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

I'm trying to debug an issue I'm having with checkForHostStatus in webui-vu=
e/src/store/modules/Control/ControlStore.js.

I always seem to have to wait the full 5 minutes to see my power state chan=
ge even though I know that it's happening on the server.  I'm not very fami=
liar with vue so I'm not sure how to trace back the calls that would update=
 state.global.hostStatus from the BMC.  There's no other usage of "state.gl=
obal.*" in the webui so I'm not even sure if that syntax is correct.

As far as I can tell, the changes to the global hostStatus should happen in=
 getHostStatus() in GlobalStore.js but I can't see where getHostStatus() is=
 called for the watch in the context of the ServerPowerOperations page.

Any tips?

--MCBoundary=_12103292011040561
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=WINDOWS-1252

<HTML><BODY>I'm trying to debug an issue I'm having with checkForHostStatus=
 in webui-vue/src/store/modules/Control/ControlStore.js.<BR>
<BR>
I always seem to have to wait the full 5 minutes to see my power state chan=
ge even though I know that it's happening on the server.  I'm not very fami=
liar with vue so I'm not sure how to trace back the calls that would update=
 state.global.hostStatus from the BMC.  There's no other usage of &quot;sta=
te.global.*&quot; in the webui so I'm not even sure if that syntax is corre=
ct.<BR>
<BR>
As far as I can tell, the changes to the global hostStatus should happen in=
 getHostStatus() in GlobalStore.js but I can't see where getHostStatus() is=
 called for the watch in the context of the ServerPowerOperations page.<BR>
<BR>
Any tips?<BR>
</BODY></HTML>

--MCBoundary=_12103292011040561--

