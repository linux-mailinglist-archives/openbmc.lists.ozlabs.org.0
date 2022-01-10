Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 296FC48950F
	for <lists+openbmc@lfdr.de>; Mon, 10 Jan 2022 10:20:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXSw20FkTz2ywZ
	for <lists+openbmc@lfdr.de>; Mon, 10 Jan 2022 20:20:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=keOxUMn3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=in.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=devenrao@in.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=keOxUMn3; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JXSvY01TSz2xv8
 for <openbmc@lists.ozlabs.org>; Mon, 10 Jan 2022 20:19:36 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20A85qOG018124
 for <openbmc@lists.ozlabs.org>; Mon, 10 Jan 2022 09:19:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : from : to
 : cc : date : message-id : content-transfer-encoding : content-type :
 mime-version : references : subject; s=pp1;
 bh=CTZhI5j8tsoy1UhwIpa5NYeuMAY4V7UqRTvoUxs64OM=;
 b=keOxUMn3Oe7jOx6oECLchH6Gpz2eVu0dhQehYh0XJuNkG6ESe9hE2rmpYb/B8mPP/zSH
 KjRBCtjBnjof9FDzLUTZkDecZPhojsTjCDMyDj6CWX2LbQrthcSb3POH6EJMnalGaKbf
 v+6sYlQgoSfjZT03kduUpNVAzz71CNy9bA5obNbQRwxEcun5eiWvDEWCY+Jf0uglhhBu
 h6JmoFlePTNhZwyTaYyJ2P0eMk+uDm7KqFCL7BKIfzYUSH1S+i5WNPw4fIDGbQ7GBPKt
 4nXBZGp8P3m5Ao8X0xeAkGQcriZSwzMXaoKMD8Dge6dvd0arZRhtG0oEhKx1v8RCdYAs 6A== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dfm5rnsyc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 10 Jan 2022 09:19:32 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20A9DgHl017552
 for <openbmc@lists.ozlabs.org>; Mon, 10 Jan 2022 09:19:31 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02dal.us.ibm.com with ESMTP id 3df289eukg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 10 Jan 2022 09:19:31 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20A9JUd014746254
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Jan 2022 09:19:30 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 07145BE051;
 Mon, 10 Jan 2022 09:19:30 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E73DABE053;
 Mon, 10 Jan 2022 09:19:29 +0000 (GMT)
Received: from mww0422.dal12m.mail.ibm.com (unknown [9.208.69.83])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Mon, 10 Jan 2022 09:19:29 +0000 (GMT)
In-Reply-To: <c60f01b8-a200-3dd5-56dc-9a327e1e4bc0@linux.ibm.com>
From: "Devender Rao" <devenrao@in.ibm.com>
To: mspinler@linux.ibm.com
Date: Mon, 10 Jan 2022 09:19:28 +0000
Message-ID: <OFABECB89A.F71959AD-ON002587C6.00331EB2-002587C6.003338B9@ibm.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
Sensitivity: 
MIME-Version: 1.0
References: <c60f01b8-a200-3dd5-56dc-9a327e1e4bc0@linux.ibm.com>,
 <63f93b08.79d.17dea0b1142.Coremail.ouyangxuan10@163.com>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: Lotus Domino Web Server Release 11.0.1FP2HF125   November 22, 2021
X-MIMETrack: Serialize by http on MWW0422/03/M/IBM at 01/10/2022 09:19:28,
 Serialize complete at 01/10/2022 09:19:28
X-Disclaimed: 49515
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RxzndN28ruZd7QeWkrQzRL0mHgLWEMcg
X-Proofpoint-ORIG-GUID: RxzndN28ruZd7QeWkrQzRL0mHgLWEMcg
Subject: RE: [obmc]: sometime,
 the method of GetObject in phosphor-objmgr cannot get path or object
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-10_03,2022-01-07_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 adultscore=0 clxscore=1011 impostorscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201100064
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
Cc: ouyangxuan10@163.com, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10pt" ><div dir=3D"ltr" >Can you try it on t=
he latest driver? I did see an issue listing certificates on Dec 13th drive=
r even though certificates exist on the system, but latest driver looks goo=
d. I did not debug though, but assume it is side-effect of some changes don=
e to sdbusplus(not sure).</div>
<div dir=3D"ltr" >&nbsp;</div>
<blockquote data-history-content-modified=3D"1" dir=3D"ltr" style=3D"border=
-left:solid #aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr; =
margin-right:0px" >----- Original message -----<br>From: "Matt Spinler" &lt=
;mspinler@linux.ibm.com&gt;<br>Sent by: "openbmc" &lt;openbmc-bounces+deven=
rao=3Din.ibm.com@lists.ozlabs.org&gt;<br>To: "www" &lt;ouyangxuan10@163.com=
&gt;, "openbmc@lists.ozlabs.org" &lt;openbmc@lists.ozlabs.org&gt;<br>Cc:<br=
>Subject: [EXTERNAL] Re: [obmc]: sometime, the method of GetObject in phosp=
hor-objmgr cannot get path or object<br>Date: Wed, Jan 5, 2022 12:59 AM<br>=
&nbsp;
<div><br><font face=3D"Default Monospace,Courier New,Courier,monospace" siz=
e=3D"2" >On 12/23/2021 7:25 PM, www wrote:<br>&gt; Dear All, Sometimes the =
GetObject method in phosphor-objmgr fails to<br>&gt; obtain path or object.=
 Does anyone know why? How to solve it? Services<br>&gt; and objects exist.=
 thanks=EF=BC=8C Byron =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =
=E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=
=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D<br>&gt; =
=E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=
=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=
=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =
=E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=
=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D<br>&gt; =E2=80=8D =
=E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=
=80=8D =E2=80=8D =E2=80=8D =E2=80=8D<br>&gt; Dear All,<br>&gt;<br>&gt; Some=
times the GetObject method in phosphor-objmgr fails to obtain path<br>&gt; =
or object.&nbsp;Does anyone know why? How to solve it?<br>&gt;<br>&gt; Serv=
ices and objects exist.<br>&gt;<br><br>I've never heard of any sort of mapp=
er problems like this.&nbsp; How often<br>does it happen?<br><br>If you wer=
e to restart that service, would the mapper then see it? Can<br>you tell fr=
om the journal if that service starts before or after the<br>mapper service=
 (not that it should matter of course)?<br><br><br>&gt; thanks=EF=BC=8C<br>=
&gt; Byron<br>&gt;<br>&gt;<br>&gt;<br>&gt;</font><br>&nbsp;</div></blockquo=
te>
<div dir=3D"ltr" >&nbsp;</div></div><BR>
<BR>
