Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 39024277FDA
	for <lists+openbmc@lfdr.de>; Fri, 25 Sep 2020 07:17:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ByKtS4JRDzDqR1
	for <lists+openbmc@lfdr.de>; Fri, 25 Sep 2020 15:17:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vishwa@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=JzhBDkwb; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ByKgz1BHWzDqvZ
 for <openbmc@lists.ozlabs.org>; Fri, 25 Sep 2020 15:08:43 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08P52GZa032829
 for <openbmc@lists.ozlabs.org>; Fri, 25 Sep 2020 01:08:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : mime-version :
 content-type : from : in-reply-to : date : cc : content-transfer-encoding
 : message-id : references : to; s=pp1;
 bh=QMyDKvmIA7Ll6c0cClxwzcDXEn14gLe+7v3JKjNQVhI=;
 b=JzhBDkwbttuTtkFFLIpVUwVz+RdlJ08eH3YbMOygjgcmlqX/rxPjobbUGzzIy+4Q95FX
 bZent47+4VHHQPwzfnABAuqR+Qr7zam1XZgK4yD+PIc7BfROp3vmTkDmeWuOGvnpy0Xd
 5J6omWW66oVf/PFrmu9CJFm7WUolZyeW8mQQ3MMXmJQocnRmeYTKpJf/y5xjAGXU4vwX
 e8NC9N+X3jo58LMqB0wEHeIELufNFRjmDEFtO0FtTe0i8dwjr4KdZA9pxsaYoUPEts1j
 /FxCawT+hv7cTi7l0luzPk2mv4mvqz9EJuGutlEkH/TwxLxSyxp4/u3UkrhJKTJN4crH 4A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33s9xbrar2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 25 Sep 2020 01:08:39 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08P55Cw6041254
 for <openbmc@lists.ozlabs.org>; Fri, 25 Sep 2020 01:08:39 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33s9xbraqd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Sep 2020 01:08:39 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08P56sYD023635;
 Fri, 25 Sep 2020 05:08:37 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 33n9m8dwuj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Sep 2020 05:08:37 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08P58ZTU20906318
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Sep 2020 05:08:35 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D3CB0AE057;
 Fri, 25 Sep 2020 05:08:34 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2372BAE05D;
 Fri, 25 Sep 2020 05:08:34 +0000 (GMT)
Received: from [9.77.207.203] (unknown [9.77.207.203])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri, 25 Sep 2020 05:08:33 +0000 (GMT)
Subject: Re: Action: OpenBMC community messaging survey
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Content-Type: text/html;
	charset=utf-8
X-Apple-Auto-Saved: 1
X-Apple-Mail-Plain-Text-Draft: yes
From: vishwanatha subbanna <vishwa@linux.vnet.ibm.com>
X-Apple-Mail-Remote-Attachments: YES
X-Apple-Base-Url: x-msg://4/
In-Reply-To: <fc2dfb5a-2053-19c3-a228-214986283003@gmail.com>
X-Apple-Windows-Friendly: 1
Date: Thu, 24 Sep 2020 22:02:37 +0530
X-Apple-Mail-Signature: SKIP_SIGNATURE
Content-Transfer-Encoding: quoted-printable
Message-Id: <DF5944BE-07DE-4CFB-9D65-12D2AE60D868@linux.vnet.ibm.com>
References: <19c81092-8639-ce87-2515-c77ef7ae9001@gmail.com>
 <2fc9aa49-20d4-7fc3-86be-459ace8791da@linux.ibm.com>
 <fc2dfb5a-2053-19c3-a228-214986283003@gmail.com>
X-Uniform-Type-Identifier: com.apple.mail-draft
To: krtaylor <kurt.r.taylor@gmail.com>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-25_01:2020-09-24,
 2020-09-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 malwarescore=0 spamscore=0 mlxscore=0 suspectscore=0
 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0 clxscore=1011
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009250031
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Joseph Reynolds <jrey@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

<html><head></head><body dir=3D"auto" style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" =
class=3D"ApplePlainTextBody"><div class=3D"ApplePlainTextBody">I agree =
with some of the responses here. It did not match my IRC =
usage.<br><br>Can the survey have something like =E2=80=9CI use IRC, but =
I feel it is unintuitive and would be nice if =
Slack=E2=80=9D<br><br>Thanks,<br>!! Vishwa !!<br><br><blockquote =
type=3D"cite">On 24-Sep-2020, at 7:15 PM, krtaylor =
&lt;kurt.r.taylor@gmail.com&gt; wrote:<br><br>On 9/23/20 9:58 PM, Joseph =
Reynolds wrote:<br><blockquote type=3D"cite">On 9/23/20 2:48 PM, =
krtaylor wrote:<br><blockquote type=3D"cite">Hello everyone,<br><br>I am =
doing a survey. If you DO NOT use IRC, would you start communicating =
regularly with the community if we used a different messaging platform? =
Maybe some other reason?<br><br>I am not suggesting anything at the =
moment, just looking at ways to remove any communication barriers and =
improve open designs and development.<br><br>If you DO NOT USE IRC =
regularly, please follow this link for a short survey. It is completely =
anonymous and will remain open until 12:00pm Central, Monday September =
28th.<br></blockquote>Hi Kurt. &nbsp;Thanks for trying to improve =
communication within the OpenBMC community.<br>I was confused by the =
survey and did not submit my answers. &nbsp;I use the IRC (per [1]) but =
sometimes go days without reading, and rarely =
<br></blockquote><br>Thanks for the question - I could have been more =
clear about "regular use", and in the survey I do say that a bit =
better.<br><br>=46rom your description, I would say that you are not a =
regular user of IRC. That is, you do your work without periodically =
discussing it in IRC, and are not actively participating in others work =
and design discussions. Absolutely no judgement here, this is a common =
situation that we can hopefully address and facilitate for other =
developers.<br><br>Please feel free to take the survey, the feedback =
will be very much appreciated.<br><br>Kurt Taylor =
(krtaylor)<br><br><blockquote type=3D"cite">respond. &nbsp;I find IRC =
setup confusing, but easy enough to use. &nbsp;And I would prefer to use =
slack features such as a full conversation history and threaded =
conversations.<br>- Joseph<br>[1]: =
https://github.com/openbmc/openbmc#contact<br><blockquote =
type=3D"cite">https://www.surveymonkey.com/r/33BVDR6<br><br>THANKS!<br><br=
>Kurt Taylor =
(krtaylor)<br></blockquote></blockquote></blockquote><br></div></body></ht=
ml>=
