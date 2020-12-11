Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB042D6D1E
	for <lists+openbmc@lfdr.de>; Fri, 11 Dec 2020 02:14:54 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CsXrX334szDqQm
	for <lists+openbmc@lfdr.de>; Fri, 11 Dec 2020 12:14:52 +1100 (AEDT)
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
 header.s=mimecast20170203 header.b=SSpcX7PF; 
 dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com
 header.a=rsa-sha256 header.s=mimecast20170203 header.b=SSpcX7PF; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [63.128.21.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CsXqg6hvjzDqSQ
 for <openbmc@lists.ozlabs.org>; Fri, 11 Dec 2020 12:14:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1607649239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wYx2xGMaiP6YkmHYqWO1ib07XQ04tjl/DvJYUS059UA=;
 b=SSpcX7PFZg4hoaGLlxXI4Q2VcbzZCOYganOJm9NNFmzLYsmjtSGIiPwfV12lF11rIGy2wp
 3ljGA5AiNfZR0BZeMD7Tf0r4gXt5j1+iO+B5iPjgLXUSo6VI9UpDILE74pmkTz5Lubnx4C
 CBJafQNIuI4ILBLnp5CZz5O6HJtM6mE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1607649239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wYx2xGMaiP6YkmHYqWO1ib07XQ04tjl/DvJYUS059UA=;
 b=SSpcX7PFZg4hoaGLlxXI4Q2VcbzZCOYganOJm9NNFmzLYsmjtSGIiPwfV12lF11rIGy2wp
 3ljGA5AiNfZR0BZeMD7Tf0r4gXt5j1+iO+B5iPjgLXUSo6VI9UpDILE74pmkTz5Lubnx4C
 CBJafQNIuI4ILBLnp5CZz5O6HJtM6mE=
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-bbPXM11mOIyuZ2k2NUC38w-1; Thu, 10 Dec 2020 20:13:57 -0500
X-MC-Unique: bbPXM11mOIyuZ2k2NUC38w-1
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Thu, 10 Dec 2020 17:13:54 -0800
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Thu, 10 Dec 2020 17:13:54 -0800
From: Patrick Voelker <Patrick_Voelker@phoenix.com>
To: Andrei Kartashev <a.kartashev@yadro.com>, Andrew Jeffery
 <andrew@aj.id.au>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: Unresponsive BMC after booting into Ubuntu
Thread-Topic: Unresponsive BMC after booting into Ubuntu
Thread-Index: AdbB6IVyteZuFHQ2RRKT4gj4Gu4WPwAe7UuAAAv3iCABSpq4AAHm9v2w
Date: Fri, 11 Dec 2020 01:13:54 +0000
Message-ID: <d75be44a237e4de6ac94f6d84fc3935e@SCL-EXCHMB-13.phoenix.com>
References: <f659f8a48f24404fbc5dda747000865d@SCL-EXCHMB-13.phoenix.com>
 <6cc50da92b76ff7fbda5f43651bb32f6ff7b0c9e.camel@yadro.com>
 <eaec79dfa2bc4d65acd2fdb8c93b02f9@SCL-EXCHMB-13.phoenix.com>
 <e9389df6-f4f5-4594-a803-b3b7598fb21e@www.fastmail.com>
In-Reply-To: <e9389df6-f4f5-4594-a803-b3b7598fb21e@www.fastmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.122.68.146]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: SCL-EXCHMB-13.phoenix.com
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA70A150 smtp.mailfrom=patrick_voelker@phoenix.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: phoenix.com
Content-Language: en-US
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
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

I gave disabling the cpusensor service a try and it didn't make a differenc=
e.  The BMC still goes out to lunch.  Thanks for the suggestion.

I tried disabling all the IPMI handlers but that didn't seem to help either=
:
systemctl stop phosphor-ipmi-kcs@ipmi_kcs3
systemctl stop phosphor-ipmi-kcs@ipmi_kcs4
systemctl stop phosphor-ipmi-net@eth0.socket
systemctl stop phosphor-ipmi-net@eth1.socket
systemctl stop phosphor-ipmi-host

I think my next step will be to try disabling kernel config options that ar=
e related to things that can be influenced by the host.

> -----Original Message-----
> From: openbmc [mailto:openbmc-
> bounces+patrick_voelker=3Dphoenix.com@lists.ozlabs.org] On Behalf Of
> Andrew Jeffery
> Sent: Monday, November 30, 2020 4:47 PM
> To: openbmc@lists.ozlabs.org
> Subject: Re: Unresponsive BMC after booting into Ubuntu
>=20
>=20
>=20
> On Tue, 24 Nov 2020, at 18:05, Patrick Voelker wrote:
> > Hm.  Sounds like a different issue. I don't think this solution will
> > help me since I can't access the serial console.
>=20
> I'm not Andrei, but my understanding was that he wasn't suggesting you tr=
y
> to
> apply the change after the lockup occurred, but rather before. And then i=
f
> you
> don't see lockups with the change applied, then it might be the same
> problem.
> It wasn't about recovering the BMC from the lockup context.
>=20
> But yeah, hopefully I'm not adding to the confusion here!
>=20
> Andrew

