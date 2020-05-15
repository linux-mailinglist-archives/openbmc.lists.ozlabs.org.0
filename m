Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC6A1D4E1B
	for <lists+openbmc@lfdr.de>; Fri, 15 May 2020 14:51:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49NpFP2TZxzDqtr
	for <lists+openbmc@lfdr.de>; Fri, 15 May 2020 22:51:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tomjose@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49NpCX47grzDqrn
 for <openbmc@lists.ozlabs.org>; Fri, 15 May 2020 22:49:59 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04FBXkBT024484; Fri, 15 May 2020 08:05:47 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3119dby4ja-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 May 2020 08:05:47 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04FBYNml027430;
 Fri, 15 May 2020 08:05:46 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3119dby4ha-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 May 2020 08:05:46 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 04FC5iJv016788;
 Fri, 15 May 2020 12:05:44 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma05fra.de.ibm.com with ESMTP id 3100ub28k7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 May 2020 12:05:44 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04FC5gri64552968
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 May 2020 12:05:42 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2D814A404D;
 Fri, 15 May 2020 12:05:42 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5C614A4053;
 Fri, 15 May 2020 12:05:37 +0000 (GMT)
Received: from [9.85.119.45] (unknown [9.85.119.45])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri, 15 May 2020 12:05:36 +0000 (GMT)
Subject: Re: Redfish: Disable/enable out of band IPMI
To: apparao.puli@linux.intel.com,
 "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
References: <CALzeG+-bxR0oqA_h8Gaf-RQLJygL1QYXy3y2DU=GKdLC9nhWhw@mail.gmail.com>
 <aa329f9e-9e66-d5e7-ecac-e54c23e16a48@linux.ibm.com>
 <d6b94dbe-a6c5-1b19-63e7-1695c3794e78@linux.ibm.com>
 <CALzeG+-dbvwLseu9agpKp5L8vVkNMabM76UOmuDo2sh0uS_qFA@mail.gmail.com>
 <696721cc-2cf4-373e-027d-475ff8d357dc@linux.intel.com>
 <CALzeG+83r=v5G_jiCV2M9XErD3fXiMYcti3zknO-YY3_yL59DQ@mail.gmail.com>
From: TOM JOSEPH <tomjose@linux.vnet.ibm.com>
Message-ID: <7ff70ad6-8e51-93c3-1175-2bce01e4db77@linux.vnet.ibm.com>
Date: Fri, 15 May 2020 17:35:33 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CALzeG+83r=v5G_jiCV2M9XErD3fXiMYcti3zknO-YY3_yL59DQ@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------28E2BBB06C933F2590235490"
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-15_04:2020-05-15,
 2020-05-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 impostorscore=0 bulkscore=0
 cotscore=-2147483648 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 adultscore=0 clxscore=1011 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005150101
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, karo33bug@gmail.com,
 Joseph Reynolds <jrey@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------28E2BBB06C933F2590235490
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello AppaRao/Richard,

I took a stab at service-config-manager. Got it running on one of our 
systems. Thanks for upstreaming it. Few questions i had:

1) Are the Redfish changes yet to be upstreamed? 
https://github.com/openbmc/bmcweb/commit/ec4974dd6a419b7f5556d4dcf4b8b836b5efbbd9 
Why did we not leverage service-config-manager for the Get method?

2) For the Patch method, do you have code yet to be upstreamed? If so I 
will be interested in consuming it. Otherwise I can pick it up (This is 
something which I am pursuing 
https://github.com/ibm-openbmc/dev/issues/513).

3) Are there plans to upstream the recipe file for service-config-manager?

4) The interface exposed by the application looked different from this 
(https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Control/Service/Attributes.interface.yaml)

5) For disabling out of band IPMI, there could be multiple instances of 
phosphor-ipmi-net that needs to be disabled/masked. How do we plan to 
achieve that? I had couple of options in mind. Let me know your thoughts.
      a) Get all object paths of the service-config-manager which match 
phosphor-ipmi-net( phosphor_2dipmi_2dnet) and then disable each interface.
      b) Use the "ListUnits" method on "/org/freedesktop/systemd1" and 
get the object paths of phosphor-ipmi-net instances.

Regards,
Tom
On 17-12-2019 08:29, Carol Wang wrote:
> Ok, I got it. Thank you!
> Waiting for the change then. :-)
>
> On Mon, Dec 16, 2019 at 9:48 PM Thomaiyar, Richard Marian
> <richard.marian.thomaiyar@linux.intel.com> wrote:
>> This came a month back, and i wanted to push the changes in intel repo
>> to the OpenBMC community repo, due to other priority missed to push the
>> same.
>>
>> https://github.com/Intel-BMC/provingground/tree/master/srvcfg-manager
>>
>> Will push the document in few day and the changes for the same.
>>
>> Regards,
>>
>> Richard
>>
>> On 12/16/2019 11:38 AM, Carol Wang wrote:
>>> rface in phosphor-dbus-interface to indicate the status
>>> of net IPMI.
>>> Have a daemon to monitor the status, if the status is changed, then
>>> enable or
>>> disable the net IPMI service and socket.
>>> 2. Check the net IPMI socket state by getData()[1] in bmcweb. If the
>>> state is
>>> "running" or "listening", the net IPMI status is true, otherwise, the
>>> status is
>>> false. Then bmcweb can enable or disable the service and socket.
>>>
>>> Wondering if anyone has any thoughts on this feature, which way is
>>> better.
>>> If add interface, in which daemon this interface should be implemented?

--------------28E2BBB06C933F2590235490
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hello AppaRao/Richard,</p>
    I took a stab at service-config-manager. Got it running on one of
    our systems. Thanks for upstreaming it. Few questions i had:<br>
    <p>1) Are the Redfish changes yet to be upstreamed? 
<a class="moz-txt-link-freetext" href="https://github.com/openbmc/bmcweb/commit/ec4974dd6a419b7f5556d4dcf4b8b836b5efbbd9">https://github.com/openbmc/bmcweb/commit/ec4974dd6a419b7f5556d4dcf4b8b836b5efbbd9</a>
      Why did we not leverage service-config-manager for the Get method?</p>
    2) For the Patch method, do you have code yet to be upstreamed? If
    so I will be interested in consuming it. Otherwise I can pick it up
    (This is something which I am pursuing
    <a class="moz-txt-link-freetext" href="https://github.com/ibm-openbmc/dev/issues/513">https://github.com/ibm-openbmc/dev/issues/513</a>). <br>
    <br>
    3) Are there plans to upstream the recipe file for
    service-config-manager?<br>
    <br>
    4) The interface exposed by the application looked different from
    this
(<a class="moz-txt-link-freetext" href="https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Control/Service/Attributes.interface.yaml">https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Control/Service/Attributes.interface.yaml</a>)<br>
    <br>
    5) For disabling out of band IPMI, there could be multiple instances
    of phosphor-ipmi-net that needs to be disabled/masked. How do we
    plan to achieve that? I had couple of options in mind. Let me know
    your thoughts.<br>
         a) Get all object paths of the service-config-manager which
    match phosphor-ipmi-net( phosphor_2dipmi_2dnet) and then disable
    each interface.<br>
         b) Use the "ListUnits" method on "/org/freedesktop/systemd1"
    and get the object paths of phosphor-ipmi-net instances.<span style="display: inline !important; float: none; background-color: rgb(255, 238, 240); color: rgb(3, 47, 98); font-family: SFMono-Regular,Consolas,Liberation Mono,Menlo,monospace; font-size: 12px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: pre-wrap; word-spacing: 0px;"></span><br>
    <br>
    Regards,<br>
    Tom<br>
    <div class="moz-cite-prefix">On 17-12-2019 08:29, Carol Wang wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CALzeG+83r=v5G_jiCV2M9XErD3fXiMYcti3zknO-YY3_yL59DQ@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">Ok, I got it. Thank you!
Waiting for the change then. :-)

On Mon, Dec 16, 2019 at 9:48 PM Thomaiyar, Richard Marian
<a class="moz-txt-link-rfc2396E" href="mailto:richard.marian.thomaiyar@linux.intel.com">&lt;richard.marian.thomaiyar@linux.intel.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
This came a month back, and i wanted to push the changes in intel repo
to the OpenBMC community repo, due to other priority missed to push the
same.

<a class="moz-txt-link-freetext" href="https://github.com/Intel-BMC/provingground/tree/master/srvcfg-manager">https://github.com/Intel-BMC/provingground/tree/master/srvcfg-manager</a>

Will push the document in few day and the changes for the same.

Regards,

Richard

On 12/16/2019 11:38 AM, Carol Wang wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">rface in phosphor-dbus-interface to indicate the status
of net IPMI.
Have a daemon to monitor the status, if the status is changed, then
enable or
disable the net IPMI service and socket.
2. Check the net IPMI socket state by getData()[1] in bmcweb. If the
state is
"running" or "listening", the net IPMI status is true, otherwise, the
status is
false. Then bmcweb can enable or disable the service and socket.

Wondering if anyone has any thoughts on this feature, which way is
better.
If add interface, in which daemon this interface should be implemented?
</pre>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------28E2BBB06C933F2590235490--

