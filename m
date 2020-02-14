Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9CA15D684
	for <lists+openbmc@lfdr.de>; Fri, 14 Feb 2020 12:27:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48JrhX2sMRzDqb1
	for <lists+openbmc@lfdr.de>; Fri, 14 Feb 2020 22:27:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vishwa@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48JrYF3Yn7zDqRG
 for <openbmc@lists.ozlabs.org>; Fri, 14 Feb 2020 22:21:21 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01EBJipv048674
 for <openbmc@lists.ozlabs.org>; Fri, 14 Feb 2020 06:21:19 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y57ddwd9n-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 14 Feb 2020 06:21:18 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwa@linux.vnet.ibm.com>;
 Fri, 14 Feb 2020 11:21:16 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 14 Feb 2020 11:21:14 -0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01EBLD6W55115934
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Fri, 14 Feb 2020 11:21:13 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A390142049
 for <openbmc@lists.ozlabs.org>; Fri, 14 Feb 2020 11:21:13 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1408242041
 for <openbmc@lists.ozlabs.org>; Fri, 14 Feb 2020 11:21:13 +0000 (GMT)
Received: from [9.102.18.124] (unknown [9.102.18.124])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Fri, 14 Feb 2020 11:21:12 +0000 (GMT)
Subject: Thoughts on representing the LED groups in Redfish ?
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Content-Type: text/html;
	charset=utf-8
X-Apple-Base-Url: x-msg://8/
X-Apple-Mail-Remote-Attachments: NO
From: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
X-Apple-Auto-Saved: 1
X-Apple-Windows-Friendly: 1
Date: Fri, 14 Feb 2020 16:51:10 +0530
X-Apple-Mail-Signature: SKIP_SIGNATURE
Content-Transfer-Encoding: quoted-printable
X-Uniform-Type-Identifier: com.apple.mail-draft
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
X-TM-AS-GCONF: 00
x-cbid: 20021411-0020-0000-0000-000003AA13AC
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20021411-0021-0000-0000-00002202022A
Message-Id: <BAEE3AD5-8D90-44FD-9111-49AD736EBB0D@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-14_03:2020-02-12,
 2020-02-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 suspectscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=302 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002140093
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
-webkit-nbsp-mode: space; line-break: after-white-space;"><meta =
http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8"><div =
style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; line-break: =
after-white-space;" class=3D"">Hello,<div class=3D""><br =
class=3D""></div><div class=3D"">Writing this to get your thoughts on =
representing LED logical groups in Redfish.</div><div class=3D""><br =
class=3D""></div><div class=3D"">OpenBmc LED subsystem has 2 =
layers</div><div class=3D""><br class=3D""></div><div class=3D"">1/. =
Logical LED group manager</div><div class=3D"">2/. Physical LED =
controller that sets ONE particular LED to On/Off/Blink</div><div =
class=3D""><br class=3D""></div><div class=3D""><b class=3D"">Logical =
LED group manager:</b></div><div class=3D""><b class=3D""><br =
class=3D""></b></div><div class=3D"">This is where we define a group =
with set of physical LEDs and their respective actions for one use =
case.</div><div class=3D""><br class=3D""></div><div class=3D"">For =
example:&nbsp;<a =
href=3D"https://github.com/openbmc/phosphor-led-manager/blob/master/led.ya=
ml" =
class=3D"">https://github.com/openbmc/phosphor-led-manager/blob/master/led=
.yaml</a></div><div class=3D""><br class=3D""></div><div class=3D"">When =
the user wants to turn on the Identify indicators, they don=E2=80=99t =
target the physical LEDs individually. Instead, they just set the =
=E2=80=9CAsserted=E2=80=9D property : =
&nbsp;=E2=80=9Cxyz/openbmc_project/led/groups/enclosure_identify/attr/Asse=
rted"</div><div class=3D""><b class=3D""><br class=3D""></b></div><div =
class=3D"">LED manager will then request physical led controllers of =
those LEDs to take the right action</div><div class=3D""><b class=3D""><br=
 class=3D""></b></div><div class=3D"">Current bmcweb actually uses the =
groups than targeting the physical LEDs. So it=E2=80=99s good.&nbsp;<a =
href=3D"https://github.com/openbmc/bmcweb/blob/1c8fba97b1feb4164e9b54cd66a=
ad530bbfc1826/redfish-core/lib/led.hpp#L33" =
class=3D"">https://github.com/openbmc/bmcweb/blob/1c8fba97b1feb4164e9b54cd=
66aad530bbfc1826/redfish-core/lib/led.hpp#L33</a></div><div class=3D""><br=
 class=3D""></div><div class=3D"">However, I am not sure if there are =
ways to express the LED logical groups in the redfish schema.</div><div =
class=3D""><br class=3D""></div><div class=3D"">Any ideas ?</div><div =
class=3D""><br class=3D""></div><div class=3D"">Thank you,</div><div =
class=3D"">!! Vishwa !!</div></div></body></html>=

