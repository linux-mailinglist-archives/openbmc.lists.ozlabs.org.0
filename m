Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FC8363AE5
	for <lists+openbmc@lfdr.de>; Mon, 19 Apr 2021 07:10:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FNvyq18d1z3bmg
	for <lists+openbmc@lfdr.de>; Mon, 19 Apr 2021 15:10:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IhCIONpj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=miltonm@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=IhCIONpj; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FNvyV5n41z30Dy
 for <openbmc@lists.ozlabs.org>; Mon, 19 Apr 2021 15:10:09 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13J559Bk164354
 for <openbmc@lists.ozlabs.org>; Mon, 19 Apr 2021 01:10:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : cc : to :
 mime-version : content-type : message-id : subject; s=pp1;
 bh=bSIHm3ewFgkBW0/Tce2gGHHbEFCH3d2358CkrscVwCY=;
 b=IhCIONpjyYgZAXJo0AM5w5l8bxJq/EeO94kfV9w28NI4mYjhASMDL9prd7VYzhw9Ze2k
 koZmNTkBoE1AsULCMMOSR7sFQLyDWtX1UHvhRUKJ3TSlgQ+B5HelwTqFJ8kysXEOQMwg
 A6Se3Fv9P3pbZthtxoql9ySjhzolZfTLr7yvg/7Wb7kNBiTagrSGLMI7e0vkpST9nuoG
 HwULXyJ1WNKNDBVN55zQ6vPSnFsjqeZezvB276xRIHHTTCY7vPLcyri2dQM61LsAJzRw
 ZJS+OdRRLlJ2SjcX/U8PXp+zWtvMlJQtRFKNNJG9cabjHLWQiSX8S603SOjWLTAzKML6 XQ== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.67])
 by mx0b-001b2d01.pphosted.com with ESMTP id 380d7d3uk5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 19 Apr 2021 01:10:07 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Mon, 19 Apr 2021 05:10:06 -0000
Received: from us1a3-smtp06.a3.dal06.isc4sb.com (10.146.103.243)
 by smtp.notes.na.collabserv.com (10.106.227.16) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 19 Apr 2021 05:10:05 -0000
Received: from us1a3-mail228.a3.dal06.isc4sb.com ([10.146.103.71])
 by us1a3-smtp06.a3.dal06.isc4sb.com
 with ESMTP id 2021041905100491-20155 ;
 Mon, 19 Apr 2021 05:10:04 +0000 
Date: Mon, 19 Apr 2021 05:10:05 +0000
From: "Milton Miller II" <miltonm@us.ibm.com>
To: "yugang.chen" <yugang.chen@linux.intel.com>,
 "Ed Tanous" <edtanous@google.com>
MIME-Version: 1.0
X-Mailer: IBM Traveler 10.0.1.2 Build 202002141540_20 on behalf of device with
 id
 mdm...eb5, type 1300 (maas360android) and description MaaS360-MaaS360
 Mail-Android:MaaS360-MaaS360 Mail-Android/7.40 at 20210419051005287 by
 DS-7f3618229700[SendMail]
X-KeepSent: 53DD579A:00826AF4-002586BC:001C6372;
 type=4; name=$KeepSent
X-LLNOutbound: False
X-Disclaimed: 42999
X-TNEFEvaluated: 1
Content-Type: multipart/mixed;
 boundary="--_com.fiberlink.maas360.email_1585376887818130"
x-cbid: 21041905-7279-0000-0000-0000050C48E6
X-IBM-SpamModules-Scores: BY=0.005093; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0; ST=0; TS=0; UL=0; ISC=; MB=0.000062
X-IBM-SpamModules-Versions: BY=3.00014940; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000296; SDB=6.01526391; UDB=6.00825164; IPR=6.01308321; 
 MB=3.00036522; MTD=3.00000008; XFM=3.00000015; UTC=2021-04-19 05:10:06
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2021-03-25 10:44:16 - 6.00012377
x-cbparentid: 21041905-7280-0000-0000-00009CA14A81
Message-Id: <OF53DD579A.00826AF4-ON002586BC.001C6372-1618809005215@notes.na.collabserv.com>
X-Proofpoint-ORIG-GUID: ihegoUHBsLvgx_K6-oxDdNXu08SaVwM5
X-Proofpoint-GUID: ihegoUHBsLvgx_K6-oxDdNXu08SaVwM5
Subject: RE: apply for a new repo "openbmc/node-data-sync"
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-19_02:2021-04-16,
 2021-04-19 signatures=0
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
Cc: openbmc@lists.ozlabs.org, Brad Bishop <bradleyb@fuzziesquirrel.com>, "Bills,
 Jason M" <jason.m.bills@linux.intel.com>, chunhui.jia@linux.intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


----_com.fiberlink.maas360.email_1585376887818130
Content-Type: multipart/alternative;
	 boundary="--_com.fiberlink.maas360.email_1585376888570211"



----_com.fiberlink.maas360.email_1585376888570211
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=utf-8

=0Ayugang.chen wrote:=0A=0A> attach the design document, please take a look=
.=0A=0APlease create a gerrit review placing this in an appropriate directo=
ry in the OpenBMC docs repository.=0A=0AThanks,=0AMilton=0A=0A

----_com.fiberlink.maas360.email_1585376888570211
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=utf-8

<br>yugang.chen wrote:<br><br>> attach the design document, please take a l=
ook.<br><br>Please create a gerrit review placing this in an appropriate di=
rectory in the OpenBMC docs repository.<br><br>Thanks,<br>Milton<br><br><BR>

----_com.fiberlink.maas360.email_1585376888570211--

----_com.fiberlink.maas360.email_1585376887818130--

