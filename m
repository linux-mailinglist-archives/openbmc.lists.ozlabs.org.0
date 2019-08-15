Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 128158E7D5
	for <lists+openbmc@lfdr.de>; Thu, 15 Aug 2019 11:10:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468LJ970ptzDqHg
	for <lists+openbmc@lfdr.de>; Thu, 15 Aug 2019 19:10:01 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lenovo.com
 (client-ip=67.219.250.210; helo=mail1.bemta24.messagelabs.com;
 envelope-from=rli11@lenovo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta24.messagelabs.com (mail1.bemta24.messagelabs.com
 [67.219.250.210])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468LC91Z2lzDqq3
 for <openbmc@lists.ozlabs.org>; Thu, 15 Aug 2019 19:05:40 +1000 (AEST)
Received: from [67.219.251.54] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-3.bemta.az-c.us-west-2.aws.symcld.net id 07/29-16224-060255D5;
 Thu, 15 Aug 2019 09:05:36 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPKsWRWlGSWpSXmKPExsWS8eIhj26CQmi
 swZONohYfNnewWpxqecHiwOQx72Sgx/kZCxkDmKJYM/OS8isSWDNaTm5jLljPV/H04DPWBsZZ
 PF2MXBxCAg1MEr83LmOCcF4zSiz+280K4exjlHjdvoy5i5GTg01ASaLl1Qr2LkYODhGBHIllt
 3VAwsICDhK/XixiB7FFBBwlNi64D2VbSXQ/vsEIYrMIqErcvvAOLM4rYCnx+v18NhBbSKBQov
 fCEVaQkZwCzhLtLdogYUYBWYknC54xgdjMAuIS5y62grVKCAhILNlznhnCFpV4+fgfK4StING
 85zULRL2OxILdn9ggbG2JZQtfM0OsFZQ4OfMJywRGkVlIxs5C0jILScssJC0LGFlWMZonFWWm
 Z5TkJmbm6BoaGOgaGhrpGhqb6Vqa6yVW6SbrlRbrlqcWl+ga6SWWF+sVV+Ym56To5aWWbGIEx
 lFKQUfiDsZzs97oHWKU5GBSEuUtnxocK8SXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mC97tcaKyQYF
 FqempFWmYOMKZh0hIcPEoivLXyQGne4oLE3OLMdIjUKUZXjgkv5y5i5ni7fB6QPHgURB5rWgI
 kN89duohZiCUvPy9VSpw3H6RZAKQ5ozQPbjQsHV1ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGo
 JMz7EeRCnsy8ErgLXgEdxwR03JsbgSDHlSQipKQamObsvsCp1La7n+v2LvdD/0Q1DR5wX1/xz
 2PKnbsOK44dYnH9cPH25uPrWnVrJyivumtl9eHjt5RpS4z4Il7y8HDYJ8g94ZmrHei5WXFek+
 Wkadd+FCUkNd08p1j0WOit1dG6px7Ff3RZl38N31Ck62EhLRUmPVtdeUpfl2yy6jQ70XeHpXV
 kpp87JnN/hfthvqX+8uzb10YLPTz/PpchcL7sf7FvRpKf2fcxqry+1qJuqB/NoCb2WmZqRoKJ
 vdCHVR2ruBOmHJFk+12yYMcljhSuZY0VfQZ30rcGrqhOuP/jwMOHp6/fXLl0RdChstOP4tJ+P
 o26a3nmyoyZVwJi2nctX2jGuuHzLyv/1ce3qAYqsRRnJBpqMRcVJwIAp9GVRMIDAAA=
X-Env-Sender: rli11@lenovo.com
X-Msg-Ref: server-31.tower-366.messagelabs.com!1565859935!163245!1
X-Originating-IP: [104.232.225.12]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9193 invoked from network); 15 Aug 2019 09:05:36 -0000
Received: from unknown (HELO aesmtp.lenovo.com) (104.232.225.12)
 by server-31.tower-366.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Aug 2019 09:05:36 -0000
Received: from HKGWPEMAIL01.lenovo.com (unknown [10.128.3.69])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id A624BB6D4BA8409FA0F9;
 Thu, 15 Aug 2019 05:05:34 -0400 (EDT)
Received: from HKGWPEMAIL04.lenovo.com (10.128.3.72) by
 HKGWPEMAIL01.lenovo.com (10.128.3.69) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1591.10; Thu, 15 Aug 2019 17:05:22 +0800
Received: from HKGWPEMAIL04.lenovo.com ([fe80::f1ef:1ffe:9927:6613]) by
 HKGWPEMAIL04.lenovo.com ([fe80::f1ef:1ffe:9927:6613%5]) with mapi id
 15.01.1591.008; Thu, 15 Aug 2019 17:05:32 +0800
From: Ivan Li11 <rli11@lenovo.com>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: [External]  Re: Question about sensor number access
Thread-Topic: [External]  Re: Question about sensor number access
Thread-Index: AdVRIVn/nYHC01CUQoC1p3ukkFbh5f//tqgA//t7EiA=
Date: Thu, 15 Aug 2019 09:05:32 +0000
Message-ID: <3854ce3f1b23419f99998cda08f15965@lenovo.com>
References: <860e21837286442b9a1cdd7d7dafe474@lenovo.com>
 <73e88c82-447d-38fb-bfa4-ddd48976d1b3@linux.intel.com>
In-Reply-To: <73e88c82-447d-38fb-bfa4-ddd48976d1b3@linux.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.128.115.1]
Content-Type: text/plain; charset="us-ascii"
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

Thanks your great support
.
I have an idea that create JSON file including threshold sensor number and =
sensor name mapping table for phosphor-sel-logger , and use sensor name to =
map the related sensor number with that JSON file when threshold sensor SEL=
 log is generated.
Please help to advise it.

Thanks,
Ivan
-----Original Message-----
From: openbmc <openbmc-bounces+rli11=3Dlenovo.com@lists.ozlabs.org> On Beha=
lf Of Bills, Jason M
Sent: Tuesday, August 13, 2019 2:57 AM
To: openbmc@lists.ozlabs.org
Subject: [External] Re: Question about sensor number access


On 8/12/2019 9:08 AM, Ivan Li11 wrote:
> Hi Team,
>=20
> I have a question about sensor number.
>=20
> As far as I know, "phosphor-host-ipmid" will parse "ipmi-sensors.yaml"=20
> and then store these sensors info(sensor number and sensor type, etc)=20
> in ipmid.
>=20
> May I know if another daemon(e.g. phosphor-sel-logger) needs sensor=20
> number info, is there any suggested method to get sensor number ?

phosphor-sel-logger stores only the sensor path and depends on something to=
 map sensor path to sensor number when the log is read.

Today, that mapping is only done for dynamic IPMI sensors in intel-ipmi-oem=
, here:=20
https://github.com/openbmc/intel-ipmi-oem/blob/master/include/sdrutils.hpp#=
L207.

We were not able to get to a final solution for handling the mapping of dyn=
amic and hardcoded sensor numbers.  You can see the ideas and discussion in=
 this review:=20
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-host-ipmid/+/12951
and this thread:=20
https://lists.ozlabs.org/pipermail/openbmc/2019-January/014890.html.

This is specifically about getting the sensor number from the path for phos=
phor-sel-logger, so it may not apply to your situation, but hopefully helps=
.

Thanks,
-Jason
>=20
> Thanks,
>=20
> Ivan
>=20
