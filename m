Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B961BA209
	for <lists+openbmc@lfdr.de>; Mon, 27 Apr 2020 13:12:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 499htv22XWzDqf5
	for <lists+openbmc@lfdr.de>; Mon, 27 Apr 2020 21:12:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ratagupt@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 499ht40RRFzDqTk
 for <openbmc@lists.ozlabs.org>; Mon, 27 Apr 2020 21:11:23 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03RB51N9133277
 for <openbmc@lists.ozlabs.org>; Mon, 27 Apr 2020 07:11:21 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30mhbh98cq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 27 Apr 2020 07:11:21 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03RBA2v0020990
 for <openbmc@lists.ozlabs.org>; Mon, 27 Apr 2020 11:11:19 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 30mcu5kqtu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 27 Apr 2020 11:11:19 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03RBBHiR5243174
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Mon, 27 Apr 2020 11:11:17 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 58DBF4C046
 for <openbmc@lists.ozlabs.org>; Mon, 27 Apr 2020 11:11:17 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D56404C04A
 for <openbmc@lists.ozlabs.org>; Mon, 27 Apr 2020 11:11:16 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.37.37])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Mon, 27 Apr 2020 11:11:16 +0000 (GMT)
Subject: Re: Default Gateway for a system v/s Default gateway per Interface
To: openbmc@lists.ozlabs.org
References: <fd2978a9-bd4b-a8ba-67ac-94a8537a9fcf@linux.vnet.ibm.com>
 <20200424152120.GD26818@heinlein.lan.stwcx.xyz>
 <CAPnigKkaj5aU-3KXKsL_LxAdZg2pccXiQz0bPPb+h8RToBzotg@mail.gmail.com>
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Message-ID: <32f161d2-784e-8fe5-a00b-e9bec181a265@linux.vnet.ibm.com>
Date: Mon, 27 Apr 2020 16:41:15 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAPnigKkaj5aU-3KXKsL_LxAdZg2pccXiQz0bPPb+h8RToBzotg@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------E0CB2A1658948249D5C83A7C"
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-27_07:2020-04-24,
 2020-04-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 phishscore=0 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 mlxlogscore=839 suspectscore=1
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004270100
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

This is a multi-part message in MIME format.
--------------E0CB2A1658948249D5C83A7C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Thanks Patrick, William for sharing the feedbacks

I will start working on the changes.


On 4/24/20 11:15 PM, William Kennington wrote:
> Sounds good to me, we have needed this for a long time because the 
> current gateway configuration breaks our v6 stack with multiple NICs.
>
> On Fri, Apr 24, 2020 at 8:21 AM Patrick Williams <patrick@stwcx.xyz 
> <mailto:patrick@stwcx.xyz>> wrote:
>
>     On Fri, Apr 24, 2020 at 08:36:26PM +0530, Ratan Gupta wrote:
>     > ~~~~~~~~~~~~~
>     > Kernel IP routing table
>     > Destination     Gateway         Genmask         Flags MSS
>     Window  irtt
>     > Iface
>     > 0.0.0.0         19.168.2.1      0.0.0.0         UG 0 0          0
>     > eth0
>     > 0.0.0.0         10.10.10.1      0.0.0.0         UG 0 0          0
>     > eth1
>     > ~~~~~~~~~~~~~~
>     >
>     > Kernel will first try using the default gateway having higher
>     metric
>     > value and then fall back to the lower.
>
>     I'm not seeing us with an interface to adjust the metric for an
>     interface.  I think we need to add that at the same time?
>
Not now, As per my testing if metric value is not defined and both the 
routes

having same metric then kernel tries one after other. We can bring the 
metric

later.

>     Otherwise, I
>     don't think we have a way to specify which interface
>     outside-the-subnet
>     should go (vs today we can set the default-gateway to the desired
>     interface's gateway).
>     -- 
>     Patrick Williams
>

--------------E0CB2A1658948249D5C83A7C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Thanks Patrick, William for sharing the feedbacks<br>
    </p>
    <p>I will start working on the changes.<br>
    </p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 4/24/20 11:15 PM, William Kennington
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAPnigKkaj5aU-3KXKsL_LxAdZg2pccXiQz0bPPb+h8RToBzotg@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">Sounds good to me, we have needed this for a long
        time because the current gateway configuration breaks our v6
        stack with multiple NICs.<br>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Fri, Apr 24, 2020 at 8:21
          AM Patrick Williams &lt;<a href="mailto:patrick@stwcx.xyz"
            moz-do-not-send="true">patrick@stwcx.xyz</a>&gt; wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On
          Fri, Apr 24, 2020 at 08:36:26PM +0530, Ratan Gupta wrote:<br>
          &gt; ~~~~~~~~~~~~~<br>
          &gt; Kernel IP routing table<br>
          &gt; Destination     Gateway         Genmask         Flags  
          MSS Window  irtt <br>
          &gt; Iface<br>
          &gt; 0.0.0.0         19.168.2.1      0.0.0.0         UG       
          0 0          0 <br>
          &gt; eth0<br>
          &gt; 0.0.0.0         10.10.10.1      0.0.0.0         UG       
          0 0          0 <br>
          &gt; eth1<br>
          &gt; ~~~~~~~~~~~~~~<br>
          &gt; <br>
          &gt; Kernel will first try using the default gateway having
          higher metric <br>
          &gt; value and then fall back to the lower.<br>
          <br>
          I'm not seeing us with an interface to adjust the metric for
          an<br>
          interface.  I think we need to add that at the same time?</blockquote>
      </div>
    </blockquote>
    <p>Not now, As per my testing if metric value is not defined and
      both the routes</p>
    <p>having same metric then kernel tries one after other. We can
      bring the metric</p>
    <p>later.<br>
    </p>
    <blockquote type="cite"
cite="mid:CAPnigKkaj5aU-3KXKsL_LxAdZg2pccXiQz0bPPb+h8RToBzotg@mail.gmail.com">
      <div class="gmail_quote">
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"> 
          Otherwise, I<br>
          don't think we have a way to specify which interface
          outside-the-subnet<br>
          should go (vs today we can set the default-gateway to the
          desired<br>
          interface's gateway).<br>
          -- <br>
          Patrick Williams<br>
        </blockquote>
      </div>
    </blockquote>
  </body>
</html>

--------------E0CB2A1658948249D5C83A7C--

