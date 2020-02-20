Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5F4165A11
	for <lists+openbmc@lfdr.de>; Thu, 20 Feb 2020 10:23:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48NTfC4JQpzDqNT
	for <lists+openbmc@lfdr.de>; Thu, 20 Feb 2020 20:23:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vishwa@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48NTdW31BmzDqN5
 for <openbmc@lists.ozlabs.org>; Thu, 20 Feb 2020 20:22:38 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01K9Kr4A121303
 for <openbmc@lists.ozlabs.org>; Thu, 20 Feb 2020 04:22:35 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y8ubph9ya-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 20 Feb 2020 04:22:35 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwa@linux.vnet.ibm.com>;
 Thu, 20 Feb 2020 09:22:34 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 20 Feb 2020 09:22:31 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 01K9LYGK37093692
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Thu, 20 Feb 2020 09:21:35 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A1FC811C05E
 for <openbmc@lists.ozlabs.org>; Thu, 20 Feb 2020 09:22:30 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4ECF811C04C
 for <openbmc@lists.ozlabs.org>; Thu, 20 Feb 2020 09:22:30 +0000 (GMT)
Received: from [9.109.160.230] (unknown [9.109.160.230])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Thu, 20 Feb 2020 09:22:30 +0000 (GMT)
Subject: Re: Thoughts on representing the LED groups in Redfish ?
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Content-Type: text/html;
	charset=utf-8
X-Apple-Auto-Saved: 1
X-Apple-Mail-Remote-Attachments: NO
From: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
X-Apple-Mail-Plain-Text-Draft: yes
X-Apple-Base-Url: x-msg://13/
In-Reply-To: <BAEE3AD5-8D90-44FD-9111-49AD736EBB0D@linux.vnet.ibm.com>
X-Apple-Windows-Friendly: 1
Date: Thu, 20 Feb 2020 14:28:59 +0530
X-Apple-Mail-Signature: SKIP_SIGNATURE
Content-Transfer-Encoding: quoted-printable
References: <BAEE3AD5-8D90-44FD-9111-49AD736EBB0D@linux.vnet.ibm.com>
X-Uniform-Type-Identifier: com.apple.mail-draft
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
X-TM-AS-GCONF: 00
x-cbid: 20022009-0020-0000-0000-000003ABDB7A
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022009-0021-0000-0000-00002203E000
Message-Id: <A5C7580C-9577-4023-89E0-F7F715538EFF@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-20_02:2020-02-19,
 2020-02-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0
 mlxlogscore=568 lowpriorityscore=0 malwarescore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002200069
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

<html><head></head><body dir=3D"auto" style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" =
class=3D"ApplePlainTextBody"><div =
class=3D"ApplePlainTextBody">Hello,<br><br>Wonder if the community has =
any thoughts ?<br><br>Thanks,<br>!! Vishwa !!<br><br><blockquote =
type=3D"cite">On 14-Feb-2020, at 4:51 PM, Vishwanatha Subbanna =
&lt;vishwa@linux.vnet.ibm.com&gt; wrote:<br><br>Hello,<br><br>Writing =
this to get your thoughts on representing LED logical groups in =
Redfish.<br><br>OpenBmc LED subsystem has 2 layers<br><br>1/. Logical =
LED group manager<br>2/. Physical LED controller that sets ONE =
particular LED to On/Off/Blink<br><br>Logical LED group =
manager:<br><br>This is where we define a group with set of physical =
LEDs and their respective actions for one use case.<br><br>For example: =
https://github.com/openbmc/phosphor-led-manager/blob/master/led.yaml<br><b=
r>When the user wants to turn on the Identify indicators, they don=E2=80=99=
t target the physical LEDs individually. Instead, they just set the =
=E2=80=9CAsserted=E2=80=9D property : =
&nbsp;=E2=80=9Cxyz/openbmc_project/led/groups/enclosure_identify/attr/Asse=
rted"<br><br>LED manager will then request physical led controllers of =
those LEDs to take the right action<br><br>Current bmcweb actually uses =
the groups than targeting the physical LEDs. So it=E2=80=99s good. =
https://github.com/openbmc/bmcweb/blob/1c8fba97b1feb4164e9b54cd66aad530bbf=
c1826/redfish-core/lib/led.hpp#L33<br><br>However, I am not sure if =
there are ways to express the LED logical groups in the redfish =
schema.<br><br>Any ideas ?<br><br>Thank you,<br>!! Vishwa =
!!<br></blockquote><br></div></body></html>=

