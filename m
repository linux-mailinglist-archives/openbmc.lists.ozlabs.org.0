Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B2618136187
	for <lists+openbmc@lfdr.de>; Thu,  9 Jan 2020 21:08:10 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47txxg6dqlzDqcK
	for <lists+openbmc@lfdr.de>; Fri, 10 Jan 2020 07:08:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gmills@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47txwy1B9dzDqZ3
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jan 2020 07:07:28 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 009K2seb080632; Thu, 9 Jan 2020 15:07:25 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xe7qvf4e2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jan 2020 15:07:24 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 009K4eXe009027;
 Thu, 9 Jan 2020 20:07:30 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01wdc.us.ibm.com with ESMTP id 2xajb70k7c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jan 2020 20:07:29 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 009K7MHx59572546
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Jan 2020 20:07:22 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B68A4BE053;
 Thu,  9 Jan 2020 20:07:22 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D8861BE04F;
 Thu,  9 Jan 2020 20:07:20 +0000 (GMT)
Received: from [9.81.198.101] (unknown [9.81.198.101])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  9 Jan 2020 20:07:20 +0000 (GMT)
Subject: Re: Redfish Dump Service Proposal
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>, openbmc@lists.ozlabs.org
References: <c31757a8-c71d-43b3-f207-426e94548065@linux.vnet.ibm.com>
 <OF3E82A637.78F050C7-ON002584CE.0025B2F4-002584CE.00271DE9@notes.na.collabserv.com>
 <CAH1kD+YfetwAmGQfjF4ytCQYhhaEorgdiA5svwjm7X91-yG1Tg@mail.gmail.com>
 <CACkAXSpCwhUwzh1uZMMkFvtkO7Tdi4xoHaq1KtaAndR8pR2gbA@mail.gmail.com>
 <ac75a152-9bdf-0029-67e8-60e4e99eb1cc@linux.intel.com>
 <CAK7WoshJ7xMhB_E-ZEpVR+1E_AuGpZfGUFToOihoC5hZ9xyGGg@mail.gmail.com>
 <CAK7WoshsUE2+GXGEgxe99vkz4aEYTdT_ZcNE_k4Y_6x7JLWsTQ@mail.gmail.com>
 <62dc3198-40d4-b0f6-4c31-cf829d9311d6@linux.intel.com>
 <bc442056-ea92-9c65-1028-50839123e5b7@linux.vnet.ibm.com>
 <a281f9ca-9dc7-9e7a-8e87-08a313d43fe9@linux.intel.com>
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
Message-ID: <62d0d9ee-ab0c-7ec9-403d-dc9487872142@linux.vnet.ibm.com>
Date: Thu, 9 Jan 2020 14:07:19 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <a281f9ca-9dc7-9e7a-8e87-08a313d43fe9@linux.intel.com>
Content-Type: multipart/alternative;
 boundary="------------DD2464D8261532D69EB2E0A8"
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-09_04:2020-01-09,
 2020-01-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 impostorscore=0
 clxscore=1011 mlxscore=0 malwarescore=0 bulkscore=0 spamscore=0
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-2001090165
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
Cc: john.leung@intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------DD2464D8261532D69EB2E0A8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

A couple comments.

On 1/7/2020 2:08 PM, Bills, Jason M wrote:
>
> On 1/7/2020 2:11 AM, Ratan Gupta wrote:
>
>>>
>>>>
>>>> On Sat, Dec 14, 2019 at 10:57 AM dhruvaraj S <dhruvaraj@gmail.com> 
>>>> wrote:
>>>>>
>>>>> On Sat, Dec 14, 2019 at 1:32 AM Bills, Jason M
>>>>> <jason.m.bills@linux.intel.com> wrote:
>>>>>>
>>>>>> I like this as well.  I'm trying to support a CPU crashdump that 
>>>>>> would
>>>>>> fit perfectly with this proposal.
>>>>>>
>>>>>> A question and some comments below:
>>>>>>
>>>>>> Will Dump only have the two types: BMC and Host?  Could this be more
>>>>>> flexible to allow for multiple different types of dumps from various
>>>>>> components?
>>>>> + I think dump types should be flexible to cover different types of
>>>>> host or bmc dumps from different components with varying formats.
>> Sure we can enhance the type of dump, it is enum in the proposal 
>> which can be enhanced.
>> What could be other dump type which I can add in the types?

Slide 15:  Since DumpType is an enum, should reason be as well? "Type" 
is a pretty typical enum in Redfish. E.g. BaseModuleType from 
https://redfish.dmtf.org/schemas/Memory.v1_8_0.json

Reason seems similar to the LogEntryCode from 
https://redfish.dmtf.org/schemas/LogEntry.v1_5_0.json

Slide 15:
"Size": 108944B
Redfish size properties typically have the unit in the name. E.g. From 
https://redfish.dmtf.org/schemas/Memory.v1_8_0.json CacheSizeMiB or 
CapacityMiB.

odata.context is getting dropped. See 
https://github.com/DMTF/Redfish/issues/2722 or 
https://github.com/DMTF/Redfish/commit/ae49f4fb1278fd435f89317c3fa53cac597e3893#diff-e82b4876efbeaa600d3b104a426f7ac5 



--------------DD2464D8261532D69EB2E0A8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>A couple comments. <br>
    </p>
    <div class="moz-cite-prefix">On 1/7/2020 2:08 PM, Bills, Jason M
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:a281f9ca-9dc7-9e7a-8e87-08a313d43fe9@linux.intel.com">
      <br>
      On 1/7/2020 2:11 AM, Ratan Gupta wrote:
      <br>
      <br>
      <blockquote type="cite">
        <blockquote type="cite">
          <br>
          <blockquote type="cite">
            <br>
            On Sat, Dec 14, 2019 at 10:57 AM dhruvaraj S
            <a class="moz-txt-link-rfc2396E" href="mailto:dhruvaraj@gmail.com">&lt;dhruvaraj@gmail.com&gt;</a> wrote:
            <br>
            <blockquote type="cite">
              <br>
              On Sat, Dec 14, 2019 at 1:32 AM Bills, Jason M
              <br>
              <a class="moz-txt-link-rfc2396E" href="mailto:jason.m.bills@linux.intel.com">&lt;jason.m.bills@linux.intel.com&gt;</a> wrote:
              <br>
              <blockquote type="cite">
                <br>
                I like this as well.  I'm trying to support a CPU
                crashdump that would
                <br>
                fit perfectly with this proposal.
                <br>
                <br>
                A question and some comments below:
                <br>
                <br>
                Will Dump only have the two types: BMC and Host?  Could
                this be more
                <br>
                flexible to allow for multiple different types of dumps
                from various
                <br>
                components?
                <br>
              </blockquote>
              + I think dump types should be flexible to cover different
              types of
              <br>
              host or bmc dumps from different components with varying
              formats.
              <br>
            </blockquote>
          </blockquote>
        </blockquote>
        Sure we can enhance the type of dump, it is enum in the proposal
        which can be enhanced.
        <br>
        What could be other dump type which I can add in the types?
        <br>
      </blockquote>
    </blockquote>
    <p>Slide 15:  Since DumpType is an enum, should reason be as well?
      "Type" is a pretty typical enum in Redfish. E.g. BaseModuleType
      from <a class="moz-txt-link-freetext" href="https://redfish.dmtf.org/schemas/Memory.v1_8_0.json">https://redfish.dmtf.org/schemas/Memory.v1_8_0.json</a><br>
      <br>
      Reason seems similar to the <span class="treeLabel objectLabel"
        aria-labelledby="default" data-level="1">LogEntryCode from</span>
      <a class="moz-txt-link-freetext" href="https://redfish.dmtf.org/schemas/LogEntry.v1_5_0.json">https://redfish.dmtf.org/schemas/LogEntry.v1_5_0.json</a><br>
      <br>
      Slide 15: <br>
      "Size": 108944B<br>
      Redfish size properties typically have the unit in the name. E.g.
      From <a class="moz-txt-link-freetext" href="https://redfish.dmtf.org/schemas/Memory.v1_8_0.json">https://redfish.dmtf.org/schemas/Memory.v1_8_0.json</a>
      CacheSizeMiB or CapacityMiB. <br>
      <br>
      odata.context is getting dropped. See
      <a class="moz-txt-link-freetext" href="https://github.com/DMTF/Redfish/issues/2722">https://github.com/DMTF/Redfish/issues/2722</a> or
<a class="moz-txt-link-freetext" href="https://github.com/DMTF/Redfish/commit/ae49f4fb1278fd435f89317c3fa53cac597e3893#diff-e82b4876efbeaa600d3b104a426f7ac5">https://github.com/DMTF/Redfish/commit/ae49f4fb1278fd435f89317c3fa53cac597e3893#diff-e82b4876efbeaa600d3b104a426f7ac5</a>
      <br>
    </p>
  </body>
</html>

--------------DD2464D8261532D69EB2E0A8--

