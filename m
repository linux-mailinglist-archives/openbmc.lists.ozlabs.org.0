Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C83C260786
	for <lists+openbmc@lfdr.de>; Tue,  8 Sep 2020 02:28:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BlmGL5pZyzDqQM
	for <lists+openbmc@lfdr.de>; Tue,  8 Sep 2020 10:28:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gmills@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=bM1XYa9g; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BlmFX3pxCzDqPb
 for <openbmc@lists.ozlabs.org>; Tue,  8 Sep 2020 10:27:42 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08801wAC073232; Mon, 7 Sep 2020 20:27:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type; s=pp1; bh=qNRNlUYtI2Q82INAHpKslhVP6ojAmWaQMtuZZK3amy0=;
 b=bM1XYa9gYzCu0556YKL5dJdJctxeLGYGE1wJW3wMuMo44dBzCVf+BPoy43n5pwXfc9tF
 sBJhd6L2TFFqLeV4xnyLWlN+ls8q2W7rPe9mHiQSrZ8rFxl4gHpYU+ctzK2t9z0eAPqS
 0IbD6A9uLAdXYHszni6Db8XlxdX2/arjishj6+fwE5fBQb6dtYd8TNFW0kqasGDi3AHS
 2z1L0urf4tIPQ+RMG/wut3+ExJRaJuB+rxnogMTv0wodBt8WwICLusZ4GIQ5EMNYb92W
 GRb0fwE3M5wghvG9ypICM5A8NPDLoiMvnUg914vv8DKMg9Vd4Pd+nIBYW9YHk9D8rOlK dQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33dxxbggvj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Sep 2020 20:27:38 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0880RcI1134847;
 Mon, 7 Sep 2020 20:27:38 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33dxxbggva-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Sep 2020 20:27:38 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0880MM0r027439;
 Tue, 8 Sep 2020 00:27:37 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02dal.us.ibm.com with ESMTP id 33c2a907bv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Sep 2020 00:27:37 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0880RXRo15074030
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Sep 2020 00:27:33 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7A3106A04F;
 Tue,  8 Sep 2020 00:27:36 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F38336A04D;
 Tue,  8 Sep 2020 00:27:34 +0000 (GMT)
Received: from [9.206.174.220] (unknown [9.206.174.220])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  8 Sep 2020 00:27:34 +0000 (GMT)
Subject: Re: Seek feedback: BMC console and debug info
To: Richard Hanley <rhanley@google.com>,
 "Bills, Jason M" <jason.m.bills@linux.intel.com>
References: <CAMXw96MQ-=Ftc5HjNThKd8A6X0hdBdjC43d6RJfzyDoN+b=7YQ@mail.gmail.com>
 <CACWQX82jRpfpeqc9a3kFA+08-CgyOjc8+jYU2Xh307hq-0_DHQ@mail.gmail.com>
 <419f732a-8d73-0450-fca6-b89d82fcd96c@linux.intel.com>
 <CAMXw96Onss5O3dRzV-vSV4bK=ri=QV0932cBSYpZS7U3G+_5kw@mail.gmail.com>
 <17248f66-6879-1118-9fdf-30295070d5d2@linux.intel.com>
 <CAH1kD+Yo8Yq-cHhRfYwvZbNXaG1_hbr0qCwNMOxT+PAB9rELHw@mail.gmail.com>
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
Message-ID: <ff9694d4-f39d-d969-4fd4-4c30ef829f6a@linux.vnet.ibm.com>
Date: Mon, 7 Sep 2020 18:27:32 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAH1kD+Yo8Yq-cHhRfYwvZbNXaG1_hbr0qCwNMOxT+PAB9rELHw@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------477E7FF7F16A17D5588B69C1"
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-07_11:2020-09-07,
 2020-09-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 mlxlogscore=999 clxscore=1011 impostorscore=0 malwarescore=0
 suspectscore=0 phishscore=0 mlxscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009070229
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

This is a multi-part message in MIME format.
--------------477E7FF7F16A17D5588B69C1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/2/2020 9:29 PM, Richard Hanley wrote:
> I've been out of the loop on this for a while. Does anyone know if 
> progress has been made on the DumpService in DMTF. I remember there 
> were some proposals a while back, but I can't remember where they left 
> off.
>

Dump/Diagnostic Data will be part of the 2020.3 Redfish Release.
2020.3 should be public in the next week or 2.

There isn't a "DumpService" but instead LogService and LogEntry were 
enhanced to support Dumps.
The merged pull request can be found at 
https://github.com/DMTF/Redfish/pull/3968 (have to be a Redfish member).

It is very similar to the WIP shown below though.

>
> On Wed, Sep 2, 2020 at 12:00 PM Bills, Jason M 
> <jason.m.bills@linux.intel.com <mailto:jason.m.bills@linux.intel.com>> 
> wrote:
>
>
>
>     On 8/29/2020 8:53 PM, Zhenfei Tai wrote:
>     > Thanks a lot for the feedback and we're glad that it's something
>     the
>     > community is interested in!
>     > We'll incorporate the advice and improve the patchset.
>     >
>     > Jason - If you have time, could you share the findings of the
>     > "AdditionalDataURI" schema change? I've only managed to find
>     some slides
>     >
>     <https://www.dmtf.org/sites/default/files/Redfish_Diagnostic_Data_Logging_Proposal_05-2020-WIP_0.pdf>
>
>     > from May.
>     Sorry, I don't know much about it besides that the schema change is
>     coming.  I checked on the DMTF website and it doesn't look like
>     the new
>     schema has been posted, yet.
>

Should be on the DMTF website in the next week or two. :)

Gunnar

--------------477E7FF7F16A17D5588B69C1
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 9/2/2020 9:29 PM, Richard Hanley
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAH1kD+Yo8Yq-cHhRfYwvZbNXaG1_hbr0qCwNMOxT+PAB9rELHw@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">I've been out of the loop on this for a while. Does
        anyone know if progress has been made on the DumpService in
        DMTF. I remember there were some proposals a while back, but I
        can't remember where they left off.
        <div><br>
        </div>
      </div>
    </blockquote>
    <br>
    Dump/Diagnostic Data will be part of the 2020.3 Redfish Release.<br>
    2020.3 should be public in the next week or 2.<br>
    <br>
    There isn't a "DumpService" but instead LogService and LogEntry were
    enhanced to support Dumps. <br>
    The merged pull request can be found at 
    <a class="moz-txt-link-freetext" href="https://github.com/DMTF/Redfish/pull/3968">https://github.com/DMTF/Redfish/pull/3968</a> (have to be a Redfish
    member). <br>
    <br>
    It is very similar to the WIP shown below though. <br>
    <br>
    <blockquote type="cite"
cite="mid:CAH1kD+Yo8Yq-cHhRfYwvZbNXaG1_hbr0qCwNMOxT+PAB9rELHw@mail.gmail.com"><br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Wed, Sep 2, 2020 at 12:00
          PM Bills, Jason M &lt;<a
            href="mailto:jason.m.bills@linux.intel.com"
            moz-do-not-send="true">jason.m.bills@linux.intel.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
          <br>
          On 8/29/2020 8:53 PM, Zhenfei Tai wrote:<br>
          &gt; Thanks a lot for the feedback and we're glad that it's
          something the <br>
          &gt; community is interested in!<br>
          &gt; We'll incorporate the advice and improve the patchset.<br>
          &gt; <br>
          &gt; Jason - If you have time, could you share the findings of
          the <br>
          &gt; "AdditionalDataURI" schema change? I've only managed to
          find some slides <br>
          &gt; &lt;<a
href="https://www.dmtf.org/sites/default/files/Redfish_Diagnostic_Data_Logging_Proposal_05-2020-WIP_0.pdf"
            rel="noreferrer" target="_blank" moz-do-not-send="true">https://www.dmtf.org/sites/default/files/Redfish_Diagnostic_Data_Logging_Proposal_05-2020-WIP_0.pdf</a>&gt;
          <br>
          &gt; from May.<br>
          Sorry, I don't know much about it besides that the schema
          change is <br>
          coming.  I checked on the DMTF website and it doesn't look
          like the new <br>
          schema has been posted, yet.<br>
        </blockquote>
      </div>
    </blockquote>
    <br>
    Should be on the DMTF website in the next week or two. :) <br>
    <br>
    Gunnar<br>
  </body>
</html>

--------------477E7FF7F16A17D5588B69C1--

