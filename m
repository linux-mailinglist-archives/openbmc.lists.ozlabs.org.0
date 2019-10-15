Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD87D72E8
	for <lists+openbmc@lfdr.de>; Tue, 15 Oct 2019 12:12:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46srp2291jzDqxX
	for <lists+openbmc@lfdr.de>; Tue, 15 Oct 2019 21:12:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lenovo.com
 (client-ip=67.219.250.214; helo=mail1.bemta24.messagelabs.com;
 envelope-from=rli11@lenovo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta24.messagelabs.com (mail1.bemta24.messagelabs.com
 [67.219.250.214])
 by lists.ozlabs.org (Postfix) with ESMTP id 46srnJ08NVzDqxQ
 for <openbmc@lists.ozlabs.org>; Tue, 15 Oct 2019 21:11:47 +1100 (AEDT)
Received: from [67.219.250.198] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-2.bemta.az-b.us-west-2.aws.symcld.net id 5C/9B-29296-25B95AD5;
 Tue, 15 Oct 2019 10:11:30 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPKsWRWlGSWpSXmKPExsWS8eIhj27Q7KW
 xBr+f6Fh82NzBanGq5QWLA5PHvJOBHudnLGQMYIpizcxLyq9IYM24sqGBreAOe8XrF9uYGxhX
 sXUxcnEICTQwSdzbOJe5i5ETyHnNKPG2KQjC3scocXquD4jNJqAk0fJqBXsXIweHiECOxLLbO
 iBhYQE9iSmPOllAbBEBfYmjN/+xQdhGEk17GsHiLAKqEs+mb2MEsXkFLCVWLV7HAjG+UGLFy0
 VgcU4BZ4n93XvAehkFZCWeLHjGBGIzC4hLnLvYyg5iSwgISCzZc54ZwhaVePn4HyuErSDRvOc
 1C0S9nsSNqVPYIGxtiWULXzND7BWUODnzCcsERpFZSMbOQtIyC0nLLCQtCxhZVjFaJBVlpmeU
 5CZm5ugaGhjoGhoa6Roam+gamhjpJVbpJumVFuuWpxaX6AK55cV6xZW5yTkpenmpJZsYgXGUU
 tDWt4Px4qw3eocYJTmYlER5b7YvjRXiS8pPqcxILM6ILyrNSS0+xCjDwaEkwft2JlBOsCg1Pb
 UiLTMHGNMwaQkOHiUR3skgad7igsTc4sx0iNQpRleOCS/nLmLmeLt8HpA8eBREHmtaAiQbe/Y
 vZRZiycvPS5US550F0iwA0pxRmgc3GpaOLjHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5r0F
 MoUnM68E7oJXQMcxAR0XqL8Y5LiSRISUVAPTNZ2KqrAgialFVmHPc3rt5spE3Wv3evU2Ka59+
 p7vTKunHjdS/zRXa8fJdy7Xs+//f9Ee6fdpaw37cquyuXu3dJoIVLy/+silU9xcYn3hhT6zEx
 fLdbZZuHmUdBYxn3v1TnOH9faEK1yFTasTj3amLOl8dDbumFXXEikr/8z2q4FXLGTqFnz41Vv
 A6TFTTlJTZPPM3YbnrizhEl328fud2n1frpVHOvtMXD6Xd77siiNP9m3cszypQl9KYv2kl3/F
 hRf3P/stbJp6f+KPvOV80puO/3+6aP2EJ2FnbFUdCl8Fc2hpNFYdOWER9pTZ9tq/jVMFTU95u
 Plz/rrJbfQjMNyw0ETJ7+l9u+ITU5Q1lFiKMxINtZiLihMBXy8/hsIDAAA=
X-Env-Sender: rli11@lenovo.com
X-Msg-Ref: server-4.tower-346.messagelabs.com!1571134289!102417!1
X-Originating-IP: [104.232.225.12]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.12; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28708 invoked from network); 15 Oct 2019 10:11:30 -0000
Received: from unknown (HELO aesmtp.lenovo.com) (104.232.225.12)
 by server-4.tower-346.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Oct 2019 10:11:30 -0000
Received: from HKGWPEMAIL03.lenovo.com (unknown [10.128.3.71])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id CB57AF8268149537EBD4;
 Tue, 15 Oct 2019 06:11:28 -0400 (EDT)
Received: from HKGWPEMAIL04.lenovo.com (10.128.3.72) by
 HKGWPEMAIL03.lenovo.com (10.128.3.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1591.10; Tue, 15 Oct 2019 18:11:27 +0800
Received: from HKGWPEMAIL04.lenovo.com ([fe80::f1ef:1ffe:9927:6613]) by
 HKGWPEMAIL04.lenovo.com ([fe80::f1ef:1ffe:9927:6613%5]) with mapi id
 15.01.1591.008; Tue, 15 Oct 2019 18:11:27 +0800
From: Ivan Li11 <rli11@lenovo.com>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: [External]  Re: IPMI SEL Event ID
Thread-Topic: [External]  Re: IPMI SEL Event ID
Thread-Index: AQHVcjV4lc6gwq9wWUmUbVLhWAk+rKdbmESg
Date: Tue, 15 Oct 2019 10:11:27 +0000
Message-ID: <a65e103c1f874371987a7c9d503c9d2f@lenovo.com>
References: <1082e383cba94367945d14175a0d787b@lenovo.com>
 <38fd5723-9e41-1415-c64b-738981c70f72@linux.intel.com>
In-Reply-To: <38fd5723-9e41-1415-c64b-738981c70f72@linux.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.128.115.1]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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

Hi Jason,

New SEL ID is still not from base number(1) after "sel clear" command with =
the fix you provided.
Is there any setting I need to notice that?
Please help to advise it.

Thanks,
Ivan
> -----Original Message-----
> From: openbmc <openbmc-bounces+rli11=3Dlenovo.com@lists.ozlabs.org> On
> Behalf Of Bills, Jason M
> Sent: Tuesday, September 24, 2019 1:36 AM
> To: openbmc@lists.ozlabs.org
> Subject: [External] Re: IPMI SEL Event ID
>=20
>=20
>=20
> On 9/22/2019 5:19 AM, Yonghui YH21 Liu wrote:
> > HI All,
> >
> >  =A0=A0=A0=A0=A0=A0=A0=A0 I find the new SEL event ID is not from base =
number(1) after
> > I run "ipmitool sel clear" command.
> >
> >  =A0=A0=A0=A0=A0=A0=A0=A0 Is it the OpenBMC default design rule ? If no=
t, any plan to
> > fix the issue?
>=20
> If you are using phosphor-sel-logger, it is a bug.  The fix for it is up =
for review
> here:
> https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-sel-logger/+/24843
>=20
> Thanks!
> -Jason
> >
> > Thanks
> >
