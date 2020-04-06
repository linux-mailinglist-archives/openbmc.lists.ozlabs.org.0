Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F40919F481
	for <lists+openbmc@lfdr.de>; Mon,  6 Apr 2020 13:25:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wp9R2SnWzDqwg
	for <lists+openbmc@lfdr.de>; Mon,  6 Apr 2020 21:24:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ratagupt@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wp8j5RvLzDqRf
 for <openbmc@lists.ozlabs.org>; Mon,  6 Apr 2020 21:24:20 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 036B4lBn099743
 for <openbmc@lists.ozlabs.org>; Mon, 6 Apr 2020 07:24:18 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3082nvhh95-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 06 Apr 2020 07:24:18 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ratagupt@linux.vnet.ibm.com>;
 Mon, 6 Apr 2020 12:23:59 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 6 Apr 2020 12:23:57 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 036BOBra53084380
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Apr 2020 11:24:11 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 40E7B11C050;
 Mon,  6 Apr 2020 11:24:11 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 07D3E11C052;
 Mon,  6 Apr 2020 11:24:10 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.92.41])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  6 Apr 2020 11:24:09 +0000 (GMT)
Subject: Re: Security Working Group - Wednesday April 1
To: Anton Kachalov <rnouse@google.com>, Manojeda@in.ibm.com
References: <44bae429-2507-e044-2d0e-c4e110dfa700@linux.ibm.com>
 <9e9929c1-1c55-43ea-236d-b14c82aacf88@linux.vnet.ibm.com>
 <CADVsX8-r8ebFydQJgGQ=C7sTFVQmxk_vFinbRi2kkJ5skRgXcA@mail.gmail.com>
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Date: Mon, 6 Apr 2020 16:54:08 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CADVsX8-r8ebFydQJgGQ=C7sTFVQmxk_vFinbRi2kkJ5skRgXcA@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------F7E8592334D86E0BD2813883"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 20040611-0008-0000-0000-0000036B75C4
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040611-0009-0000-0000-00004A8D0BB6
Message-Id: <01100446-5312-2ab4-f2e4-7bab3a86631d@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-06_05:2020-04-06,
 2020-04-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 impostorscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2004060092
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------F7E8592334D86E0BD2813883
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Anton,

I brought  the meta-selinux layer, that enables the selinux framework on 
obmc-phosphor-image and it increases the size of the image by 18MB.

This layer enables the linux kernel support for selinux framework and 
brings in a lot of tools and scripts.
Just to name a few,layer comes with binaries like

- getenforce
- setenforce
- semange
- sestatus
- audit2why
- audit2allow
- restorecon
- chcon

It also brings in various scripts that would help to label the entire 
system during the first boot.

While lot of these binaries may be only required by the developer during 
the inital phase if selinux enablement and not to the end customer.

I need to spend a little more time to see what can we remove form the 
layer.

My suggestion is  we can defer this size work for later and start 
working on how selinux can help in openBMC security.

We would be publishing the se-linux use cases in a week.

Manoj is working with me on bringing down the size of se-linux layer.

Regards

Ratan

On 4/5/20 6:58 PM, Anton Kachalov wrote:
> Hello, Ratan.
>
> Would you mind breaking down the estimation, curious about what 
> brought up 18MB when enabling SELinux.
> Precompiled rules in Android took 3MB on average.
>
> On Wed, 1 Apr 2020 at 16:22, Ratan Gupta <ratagupt@linux.vnet.ibm.com 
> <mailto:ratagupt@linux.vnet.ibm.com>> wrote:
>
>     Hi Joseph,
>
>     We did some POC around selinux, will share the detailed use-cases
>     with
>     selinux which can be useful in openbmc stack.
>
>     selinux is taking around 18MB space on flash, Is it a concern?
>
>     Regards
>
>     Ratan
>
>     On 3/31/20 9:51 PM, Joseph Reynolds wrote:
>     > This is a reminder of the OpenBMC Security Working Group meeting
>     > scheduled for this Wednesday April 1 at 10:00am PDT.
>     >
>     > We'll discuss current development items, and anything else that
>     comes up.
>     >
>     > The current topics:
>     >
>     > 1. SELinux or AppArmor plans
>     >
>     > Access, agenda, and notes are in the wiki:
>     >
>     > https://github.com/openbmc/openbmc/wiki/Security-working-group
>     >
>     > - Joseph
>     >
>

--------------F7E8592334D86E0BD2813883
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Anton,</p>
    <p>I brought  the meta-selinux layer, that enables the selinux
      framework on obmc-phosphor-image and it increases the size of the
      image by 18MB.</p>
    <p>This layer enables the linux kernel support for selinux framework
      and brings in a lot of tools and scripts.<br>
      Just to name a few,layer comes with binaries like</p>
    <p>- getenforce<br>
      - setenforce<br>
      - semange<br>
      - sestatus<br>
      - audit2why<br>
      - audit2allow<br>
      - restorecon<br>
      - chcon</p>
    <p>It also brings in various scripts that would help to label the
      entire system during the first boot.</p>
    <p>While lot of these binaries may be only required by the developer
      during the inital phase if selinux enablement and not to the end
      customer.</p>
    <p>I need to spend a little more time to see what can we remove form
      the layer. <br>
    </p>
    <p>My suggestion is  we can defer this size work for later and start
      working on how selinux can help in openBMC security.</p>
    <p>We would be publishing the se-linux use cases in a week.  <br>
    </p>
    <p>Manoj is working with me on bringing down the size of se-linux
      layer.<br>
    </p>
    <p>Regards</p>
    <p>Ratan<br>
    </p>
    <div class="moz-cite-prefix">On 4/5/20 6:58 PM, Anton Kachalov
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CADVsX8-r8ebFydQJgGQ=C7sTFVQmxk_vFinbRi2kkJ5skRgXcA@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">Hello, Ratan.
        <div><br>
        </div>
        <div>Would you mind breaking down the estimation, curious about
          what brought up 18MB when enabling SELinux.</div>
        <div>Precompiled rules in Android took 3MB on average.</div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Wed, 1 Apr 2020 at 16:22,
          Ratan Gupta &lt;<a href="mailto:ratagupt@linux.vnet.ibm.com"
            moz-do-not-send="true">ratagupt@linux.vnet.ibm.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi
          Joseph,<br>
          <br>
          We did some POC around selinux, will share the detailed
          use-cases with <br>
          selinux which can be useful in openbmc stack.<br>
          <br>
          selinux is taking around 18MB space on flash, Is it a concern?<br>
          <br>
          Regards<br>
          <br>
          Ratan<br>
          <br>
          On 3/31/20 9:51 PM, Joseph Reynolds wrote:<br>
          &gt; This is a reminder of the OpenBMC Security Working Group
          meeting <br>
          &gt; scheduled for this Wednesday April 1 at 10:00am PDT.<br>
          &gt;<br>
          &gt; We'll discuss current development items, and anything
          else that comes up.<br>
          &gt;<br>
          &gt; The current topics:<br>
          &gt;<br>
          &gt; 1. SELinux or AppArmor plans<br>
          &gt;<br>
          &gt; Access, agenda, and notes are in the wiki:<br>
          &gt;<br>
          &gt; <a
            href="https://github.com/openbmc/openbmc/wiki/Security-working-group"
            rel="noreferrer" target="_blank" moz-do-not-send="true">https://github.com/openbmc/openbmc/wiki/Security-working-group</a><br>
          &gt;<br>
          &gt; - Joseph<br>
          &gt;<br>
          <br>
        </blockquote>
      </div>
    </blockquote>
  </body>
</html>

--------------F7E8592334D86E0BD2813883--

