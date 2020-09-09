Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EA2263961
	for <lists+openbmc@lfdr.de>; Thu, 10 Sep 2020 01:27:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BmyqC228NzDqbt
	for <lists+openbmc@lfdr.de>; Thu, 10 Sep 2020 09:27:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=phoenix.com (client-ip=216.205.24.170;
 helo=us-smtp-delivery-170.mimecast.com; envelope-from=neil_bradley@phoenix.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=phoenix.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=phoenix.com header.i=@phoenix.com header.a=rsa-sha256
 header.s=mimecast20170203 header.b=ghsDw8BS; 
 dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com
 header.a=rsa-sha256 header.s=mimecast20170203 header.b=ghsDw8BS; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [216.205.24.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmypS6ZBvzDqZS
 for <openbmc@lists.ozlabs.org>; Thu, 10 Sep 2020 09:26:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1599694010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u86DDEVC7tOqigYXe2IJyF5kRqgMqZKKTTDqRTZs5mQ=;
 b=ghsDw8BSobF3FMq08uVRtEMNLCmuab+Z54juE5TccjwUa7ZCJwuAh4diBFy2oVr3jYZeTC
 wwaa4sIHLkJ5z1Jzm5j31FX/AJApISuPWEcWZM0/C5BEJswPVk5YadSjSZpf2jR90nflzQ
 XN5DLDKCNcrDpuDUny6R1+oa4bK3IXc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1599694010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u86DDEVC7tOqigYXe2IJyF5kRqgMqZKKTTDqRTZs5mQ=;
 b=ghsDw8BSobF3FMq08uVRtEMNLCmuab+Z54juE5TccjwUa7ZCJwuAh4diBFy2oVr3jYZeTC
 wwaa4sIHLkJ5z1Jzm5j31FX/AJApISuPWEcWZM0/C5BEJswPVk5YadSjSZpf2jR90nflzQ
 XN5DLDKCNcrDpuDUny6R1+oa4bK3IXc=
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-nZ8WA0TqMRSn-AIzszZ93w-1; Wed, 09 Sep 2020 19:26:48 -0400
X-MC-Unique: nZ8WA0TqMRSn-AIzszZ93w-1
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Wed, 9 Sep 2020 16:26:46 -0700
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Wed, 9 Sep 2020 16:26:45 -0700
From: Neil Bradley <Neil_Bradley@phoenix.com>
To: Joseph Reynolds <jrey@linux.ibm.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Subject: RE: bmcweb 30 second lockout
Thread-Topic: bmcweb 30 second lockout
Thread-Index: AdaG9iozMxnfwn4/QwqseainYVjCAAARGHAAAA6OQQA=
Date: Wed, 9 Sep 2020 23:26:44 +0000
Message-ID: <bd56cc8d9bdc4bdea49046d9444e2a9f@SCL-EXCHMB-13.phoenix.com>
References: <1f5b34f7029a48f39a5dfdbf9aad9e93@SCL-EXCHMB-13.phoenix.com>
 <063c4d06-8e54-4682-8d41-573ce08839b5@linux.ibm.com>
In-Reply-To: <063c4d06-8e54-4682-8d41-573ce08839b5@linux.ibm.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [50.43.115.202]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: SCL-EXCHMB-13.phoenix.com
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA70A150 smtp.mailfrom=neil_bradley@phoenix.com
X-Mimecast-Spam-Score: 0.002
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

Thanks Joseph! I'll look at this in more detail in a bit but I noticed your=
 comments here:

" This issue is to add capability for "authentication rate limiting" for BM=
CWeb (login and Basic Auth), SSH login, and ideally for IPMI authentication=
. This capability is to be independent from account lockouts, specifically =
so someone could use the auth rate limiting as an effective defense and not=
 need to lock accounts."

This is precisely what I was getting at. I'm not a fan of lockouts generall=
y because they can be abused (depending upon implementation of course), and=
 adding in auth rate limiting (just delaying a few seconds when credentials=
 are wrong) winds up making brute force attacks ineffective.

-->Neil


-----Original Message-----
From: Joseph Reynolds <jrey@linux.ibm.com>=20
Sent: Wednesday, September 9, 2020 4:21 PM
To: Neil Bradley <Neil_Bradley@phoenix.com>; OpenBMC Maillist <openbmc@list=
s.ozlabs.org>
Subject: Re: bmcweb 30 second lockout

On 9/9/20 5:13 PM, Neil Bradley wrote:
>
> I had recently read somewhere on the OpenBMC mailing list (forgive me,=20
> as I can't find it anywhere now) recently indicating that there'd be a
> 30 second lockout for a given user if there were 3 consecutive failed=20
> login attempts. My question is firstly, is this the case, and=20
> secondly, is it tied to the user globally regardless of connection or=20
> is it per user and connection? The reason I ask is that the former=20
> would still allow for a denial of service attack and want to make sure=20
> that's not actually the case.
>

I can think of two items:

1. I had pushed an experimental gerrit code review to do what you described=
.
Here: https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/31841
My idea has not gained much traction and is recorded here:=20
https://github.com/ibm-openbmc/dev/issues/2434
and here: https://github.com/linux-pam/linux-pam/issues/216
and here: https://github.com/deksai/pam_abl/issues/4
and other places.
If this ever gets merged, it would NOT the be default behavior.

2. The user lockouts for failed authentication attempts is handled by=20
pam_tally2 and controlled by Redfish APIs.
See=20
https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-extend=
ed/pam/libpam/pam.d/common-auth
In pam.d/common-auth, the default pam_tally2 deny=3D0 means "accounts are=
=20
never locked because of failed authentication attempts".

The Redfish APIs are implemented here:=20
https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/account_serv=
ice.hpp
Specifically, PATCHing /redfish/v1/AccountService/ property=20
AccountLockoutDurationor AccountLockoutThreshold invokes a D-Bus method=20
which ultimately modifies the pam.d/common-auth config file above.

Note that downstream projects may typically want to modify these default=20
settings.

3. I don't think you mean this: There is a current code review for a=20
BMCWeb enhancement to allow the BMC admin to control the idle session=20
SessionTimeout property.=A0 The minimum is 30 seconds. See=20
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/36016

- Joseph

> Thanks!
>
> =E0Neil
>

