Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEB6284509
	for <lists+openbmc@lfdr.de>; Tue,  6 Oct 2020 06:45:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C54dY4YQ3zDqJH
	for <lists+openbmc@lfdr.de>; Tue,  6 Oct 2020 15:45:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=miltonm@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=us.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=UMYy9cy2; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C54cm2cX9zDqHK
 for <openbmc@lists.ozlabs.org>; Tue,  6 Oct 2020 15:44:23 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0964WV3l068153
 for <openbmc@lists.ozlabs.org>; Tue, 6 Oct 2020 00:44:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : from : to
 : cc : date : references : content-type : message-id :
 content-transfer-encoding : mime-version : subject; s=pp1;
 bh=fJOec2ka0BlNAHYtwE/ozY/tP0uZ1BGzjre57xILNKE=;
 b=UMYy9cy2Ez/HpVZVzzHfvzZ+wTRhgoNGduZwmi+G3S20gmlZq+wUs7M4djyeMqHZS9Qn
 FH0jCuI7dOykBMeG1xfeingRbCGDtf2UwwOrrUZH7jfmxUMfJUR1fluRiTuhaNds9JSE
 Nf7W5NqzbQFViievcQuZOOpDj53fI9aho7Mk8RNmoBVPMN1NzZQC0bkPXL0CBADRgNKe
 hJL7ngn0U0ra+q7wrBbgJ9i+Fd6BWz+HpEnaBKAkidOqLkAMmdNGPptpcGYWuaUdsM1r
 6+Fb8pfmFxyKoubZX7OdMi/F8F1EPxr3EKDHC6AzXUwdWlTOuzNDGzD2ZErXPRLHT80l vQ== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 340h8err5a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 06 Oct 2020 00:44:21 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Tue, 6 Oct 2020 04:44:20 -0000
Received: from us1b3-smtp02.a3dr.sjc01.isc4sb.com (10.122.7.175)
 by smtp.notes.na.collabserv.com (10.122.47.46) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 6 Oct 2020 04:44:18 -0000
Received: from us1b3-mail228.a3dr.sjc03.isc4sb.com ([10.168.214.55])
 by us1b3-smtp02.a3dr.sjc01.isc4sb.com
 with ESMTP id 2020100604441885-48147 ;
 Tue, 6 Oct 2020 04:44:18 +0000 
In-Reply-To: <43278529-11a5-4892-b965-96c69ff1a772@beta.fastmail.com>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: "Andrew Jeffery" <andrew@aj.id.au>
Date: Tue, 6 Oct 2020 04:44:18 +0000
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <43278529-11a5-4892-b965-96c69ff1a772@beta.fastmail.com>,
 <CACPK8Xd-3e+6EO1dz7aQZqTpxamDcVPfqAgbneg2_W=vpto3Kw@mail.gmail.com>
 <20201002063414.275161-1-andrew@aj.id.au>
 <20201002063414.275161-2-andrew@aj.id.au>
 <OF049DC1D4.E5E0E847-ON002585F9.0017C7A1-002585F9.00184577@notes.na.collabserv.com>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP65 April 15, 2020 at 09:48
X-LLNOutbound: False
X-Disclaimed: 30131
X-TNEFEvaluated: 1
Content-Type: text/plain; charset=UTF-8
x-cbid: 20100604-3017-0000-0000-0000039C9829
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.404685; ST=0; TS=0; UL=0; ISC=; MB=0.001817
X-IBM-SpamModules-Versions: BY=3.00013960; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01445021; UDB=6.00776715; IPR=6.01227726; 
 MB=3.00034403; MTD=3.00000008; XFM=3.00000015; UTC=2020-10-06 04:44:19
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-10-05 23:22:38 - 6.00011920
x-cbparentid: 20100604-3018-0000-0000-00006E639C73
Message-Id: <OF18978832.D50C6D4D-ON002585F9.001A076C-002585F9.001A0773@notes.na.collabserv.com>
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
Subject: RE: [PATCH 1/3] ARM: dts: rainier: Add reserved memory for ramoops
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-06_01:2020-10-05,
 2020-10-06 signatures=0
X-Proofpoint-Spam-Reason: orgsafe
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On October 5, 2020 at about 11:30PM in some timezone, Andrew Jeffery wrote:
>On Tue, 6 Oct 2020, at 14:55, Milton Miller II wrote:
>> On October 5, 2020 about 10:23 in some timezone, Joel Stanley
>wrote:
>> >Subject: [EXTERNAL] Re: [PATCH 1/3] ARM: dts: rainier: Add
>reserved
>> >memory for ramoops
>> >
>> >On Fri, 2 Oct 2020 at 06:35, Andrew Jeffery <andrew@aj.id.au>
>wrote:
>> >>
>> >> Reserve a 1MiB region of memory to record kmsg dumps and console
>> >state
>> >> into 16kiB ring-buffer slots. The sizing allows for up to 32
>dumps
>> >to be
>> >> captured and read out.
>> >>
>> >> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
...
>> The admin guide lists KMSG_DUMP_OOPS and KMSG_DUMP_PANIC ?>>
>INVALID URI REMOVED
>oc_html_latest_admin-2Dguide_ramoops.html&d=3DDwIBAg&c=3Djf_iaSHvJObTbx-s
>iA1ZOg&r=3Dbvv7AJEECoRKBU02rcu4F5DWd-EwX8As2xrXeO9ZSo4&m=3D223EDL7j0GQPUf
>WYDv8kduEPnexbpo3b00uQAlK8YSo&s=3DMfYAUnU2h1TdWyBC7tQoG3fVUTBTwXTFurBsK
>oZw34E&e=3D=20
>>=20
>> We could have something monitoring for OOPS , copying to a log and=20
>> then unlinking the pstore after committed.
>
>systemd-pstore already does this for us, no further configuration
>required.

Do we have something that creates service records for these messages?=20=20
I was hoping for something like a PEL for the bmc software.

Not as part of this kernel series though.

milton


