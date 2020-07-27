Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9740722FC98
	for <lists+openbmc@lfdr.de>; Tue, 28 Jul 2020 01:06:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFwQw2MJ4zDqnp
	for <lists+openbmc@lfdr.de>; Tue, 28 Jul 2020 09:06:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ami.com
 (client-ip=63.147.10.42; helo=atlmailgw2.ami.com; envelope-from=lucasp@ami.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ami.com
X-Greylist: delayed 909 seconds by postgrey-1.36 at bilbo;
 Tue, 28 Jul 2020 08:52:19 AEST
Received: from atlmailgw2.ami.com (atlmailgw2.ami.com [63.147.10.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFw6q37TbzDqwN
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jul 2020 08:52:18 +1000 (AEST)
X-AuditID: ac10606f-4c5ff70000003ed3-9c-5f1f570d566c
Received: from atlms2.us.megatrends.com (atlms2.us.megatrends.com
 [172.16.96.152])
 (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by atlmailgw2.ami.com (Symantec Messaging Gateway) with SMTP id
 47.00.16083.D075F1F5; Mon, 27 Jul 2020 18:37:01 -0400 (EDT)
Received: from ATLMS1.us.megatrends.com ([fe80::8c55:daf0:ef05:5605]) by
 atlms2.us.megatrends.com ([fe80::29dc:a91e:ea0c:cdeb%12]) with mapi id
 14.03.0468.000; Mon, 27 Jul 2020 18:37:01 -0400
From: Lucas Panayioto <lucasp@ami.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: openBMC LDAP current state
Thread-Topic: openBMC LDAP current state
Thread-Index: AdZkZnHXtMhRMUGeQD6GURdSh1e9PQ==
Date: Mon, 27 Jul 2020 22:37:01 +0000
Message-ID: <F3BFABD31E77FC429077E1D70660C6D2022CAABC5A@atlms1.us.megatrends.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.76.222]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJIsWRmVeSWpSXmKPExsWyRiBhhi5vuHy8wdI3IhanWl6wODB6nJ+x
 kDGAMaqB0SYxLy+/JLEkVSEltTjZVimgKLMsMblSSSEzxVbJUEmhICcxOTU3Na/EVimxoCA1
 L0XJjksBA9gAlWXmKaTmJeenZOal2yp5BvvrWliYWuoaKtmFZKQqZOal5RflJpZk5ucpJOfn
 lQBVp6YARRUSujkzZhz5xFqwnrniwULzBsZrTF2MHBwSAiYSHx9kdDFycggJ7GKSWL5DvYuR
 C8g+zCix7c4DRpAEm4CaxKsLx9lBbBEBS4klD9rZQHqFBZQlvnWKQ4Q1JLYeewpVoicxdcF9
 MJtFQFXizdpbzCA2r0CgRN+0L0wgNqOAmMT3U2vAbGYBcYlbT+aD2RICAhJL9pxnhrBFJV4+
 /scKYStKrJrZzgpRryOxYPcnNghbW2LZwtdQ8wUlTs58wjKBUWgWkrGzkLTMQtIyC0nLAkaW
 VYxCiSU5uYmZOenlRnqJuZl6yfm5mxgh8Zq/g/HjR/NDjEwcjIcYJTiYlUR4uUVl4oV4UxIr
 q1KL8uOLSnNSiw8xOgE9PJFZihsU8sCojDc2MJAShXEMTcxMzI3MDS1NzI2NlcR5J61dEyck
 kA5MEtmpqQWpRTBDmDg4pRoYp1fN+xnw7dOXIkN3yU8xel/E5m3ncdx7+K5aS38Jv/uH0r9N
 F7yfyNrPiZk65dp28Z5I6dORajamq01mZq9591thSw/P9sCWM2s/RZz8vdmigTtuSejzjZ+T
 pkre2SOd9tCj26t940w+e6m6N/OydML33jRRDPKKfyj9SfDawXXr3seEe8UEKbEUZyQaajEX
 FScCAPO6l83sAgAA
X-Mailman-Approved-At: Tue, 28 Jul 2020 09:05:25 +1000
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

Hi OpenBMC Commnunity,

I'm Lucas Panayioto from AMI. 
I was looking into Phosphorus-User-Management 
I wanted to get some clarity with the current state of LDAP user privilege a=
nd LDAP group privilege.

Currently LDAP Role groups do NOT check the LDAP server for members in the g=
roup and LDAP users are given a default privilege, which is NoAccess.

I wanted to know if this is correct or not

Thanks,
Lucas

Please consider the environment before printing this email.

The information contained in this message may be confidential and proprietar=
y to American Megatrends (AMI).  This communication is intended to be read o=
nly by the individual or entity to whom it is addressed or by their designee=
. If the reader of this message is not the intended recipient, you are on no=
tice that any distribution of this message, in any form, is strictly prohibi=
ted.  Please promptly notify the sender by reply e-mail or by telephone at 7=
70-246-8600, and then delete or destroy all copies of the transmission.
