Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6930813DF5E
	for <lists+openbmc@lfdr.de>; Thu, 16 Jan 2020 16:58:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47z83q4WjbzDqcR
	for <lists+openbmc@lfdr.de>; Fri, 17 Jan 2020 02:57:59 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47z8200JzjzDqcF
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jan 2020 02:56:23 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00GFrepL070643
 for <openbmc@lists.ozlabs.org>; Thu, 16 Jan 2020 10:56:20 -0500
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xhbpu5c5d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 16 Jan 2020 10:56:19 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 00GFsCGU021225
 for <openbmc@lists.ozlabs.org>; Thu, 16 Jan 2020 15:56:18 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma05wdc.us.ibm.com with ESMTP id 2xhjdv9k1w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 16 Jan 2020 15:56:18 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00GFuIUf48628160
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Jan 2020 15:56:18 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4ACDBB2064;
 Thu, 16 Jan 2020 15:56:18 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E9D36B2067;
 Thu, 16 Jan 2020 15:56:17 +0000 (GMT)
Received: from [9.53.178.224] (unknown [9.53.178.224])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 16 Jan 2020 15:56:17 +0000 (GMT)
Subject: Re: Redfish Dump Service Proposal
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
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
 <62d0d9ee-ab0c-7ec9-403d-dc9487872142@linux.vnet.ibm.com>
 <1fb0c51e-32a2-1168-1d1d-ac044a5f892c@linux.vnet.ibm.com>
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
Message-ID: <8b26e6a2-e4cf-b4b9-845b-4172a076e50f@linux.vnet.ibm.com>
Date: Thu, 16 Jan 2020 09:56:18 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1fb0c51e-32a2-1168-1d1d-ac044a5f892c@linux.vnet.ibm.com>
Content-Type: multipart/alternative;
 boundary="------------ED3974E86C3256C6471E4A3A"
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-16_05:2020-01-16,
 2020-01-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 bulkscore=0 phishscore=0 mlxlogscore=999 impostorscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001160131
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
--------------ED3974E86C3256C6471E4A3A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/16/2020 5:01 AM, Ratan Gupta wrote:
>
> Hi All,
>
>
> Further to the previous dump proposal, I have incorporated the 
> following changes.
>
>   * Having seprate LogService redfish resource for each type of dump.
>
>   * Enhance the
>     LogService(_https://redfish.dmtf.org/schemas/LogService.v1_1_3.json_)
>     property
>
>        "LogEntryType": {
>
>             "enum": [
>                       "Event",
>                       "SEL",
>                       "Oem"
> “*Dump*”
>                 ] }
>
>   * Enhance the LogService under OEM for further subsystem type
>
>       eg: hostboot dump, hypervisor dump
>
>         “OEM”: {
>
>               “*SystemType*”: { “enum” : [“HostBoot, Hypervisor, etc”] }
>
>                 }
>
>   * Enhance the Log Service for the following
>     *Properties*:
>
>      1. *DumpOverridePolicy : **This can be different for all
>         different type of dumps.*
>

LogService has a OverWritePolicy property, can we use that?


>      1. **MaxDumps: This can be different for all different type of
>         dumps.**
>
LogService has a MaxNumberOfRecords can we use that and drop this?


>     1.
>
> *Actions:*
>
>      1. *CreateLog:**If logservice (**LogEntryType **is Dump) and the
>         subsystem type is “Hypervisor” then create log will create a
>         Host hypervisor dump.*
>      2. ***DeleteAll: Delete all the logs from this log service, This
>         is a addition on the deletion of the single resource(LogEntry).*
>
LogService has a "ClearLog". Can we use that?


>     1.
>
>
>
>   * Enhance the logentry*(*_*https://redfi*
>     <https://redfish.dmtf.org/schemas/LogEntry.v1_5_0.json>__*sh.dmtf.org/schemas/LogEntry.v1_5_0.json*
>     <https://redfish.dmtf.org/schemas/LogEntry.v1_5_0.json>_*)*
>
>        "LogEntryType": {
>             "enum": [
>                       "Event",
>                       "SEL",
>                       "Oem"
> “*Dump*”
>                 ] }
>
>   * Map the proposed dump properties with existing log entry property
>       o Proposed Property           Existing LogEntry Property
>           + ID                          ID
>           + Timestamp                   Created
>           + Reason                      LogEntryCode(Introduce more
>             enums in the LogEntry Code for the
>             dump                         reason)
>
>   * New Properties to be introduced in the logEntry
>       o *Size*
>

Redfish size properties typically have the unit in the name.


>       o *NOTE: *Dump type is not needed as the logservice logentry
>         type will tell that this service is for dump and the system
>         type will tell that this service is for which subsytem.
>
> *NOTE: *
>
> *1/ OdataID of log entry redfish resourc**e**will point to the raw 
> dump file which can be used to offload the dump.*
>
> *2/ CreateLog: **spawns a task and returns the taskID.Client can query 
> the status for the task.*
>
>
> Please let me know if I have missed something else.I would be making 
> the change in the PPT also.
>
> Regards
>
> Ratan Gupta
>
> On 10/01/20 1:37 AM, Gunnar Mills wrote:
>>
>> A couple comments.
>>
>> On 1/7/2020 2:08 PM, Bills, Jason M wrote:
>>>
>>> On 1/7/2020 2:11 AM, Ratan Gupta wrote:
>>>
>>>>>
>>>>>>
>>>>>> On Sat, Dec 14, 2019 at 10:57 AM dhruvaraj S 
>>>>>> <dhruvaraj@gmail.com> wrote:
>>>>>>>
>>>>>>> On Sat, Dec 14, 2019 at 1:32 AM Bills, Jason M
>>>>>>> <jason.m.bills@linux.intel.com> wrote:
>>>>>>>>
>>>>>>>> I like this as well.  I'm trying to support a CPU crashdump 
>>>>>>>> that would
>>>>>>>> fit perfectly with this proposal.
>>>>>>>>
>>>>>>>> A question and some comments below:
>>>>>>>>
>>>>>>>> Will Dump only have the two types: BMC and Host? Could this be 
>>>>>>>> more
>>>>>>>> flexible to allow for multiple different types of dumps from 
>>>>>>>> various
>>>>>>>> components?
>>>>>>> + I think dump types should be flexible to cover different types of
>>>>>>> host or bmc dumps from different components with varying formats.
>>>> Sure we can enhance the type of dump, it is enum in the proposal 
>>>> which can be enhanced.
>>>> What could be other dump type which I can add in the types?
>>
>> Slide 15:  Since DumpType is an enum, should reason be as well? 
>> "Type" is a pretty typical enum in Redfish. E.g. BaseModuleType from 
>> https://redfish.dmtf.org/schemas/Memory.v1_8_0.json
>>
>> Reason seems similar to the LogEntryCode from 
>> https://redfish.dmtf.org/schemas/LogEntry.v1_5_0.json
>>
>> Slide 15:
>> "Size": 108944B
>> Redfish size properties typically have the unit in the name. E.g. 
>> From https://redfish.dmtf.org/schemas/Memory.v1_8_0.json CacheSizeMiB 
>> or CapacityMiB.
>>
>> odata.context is getting dropped. See 
>> https://github.com/DMTF/Redfish/issues/2722 or 
>> https://github.com/DMTF/Redfish/commit/ae49f4fb1278fd435f89317c3fa53cac597e3893#diff-e82b4876efbeaa600d3b104a426f7ac5 
>>
>>

--------------ED3974E86C3256C6471E4A3A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 1/16/2020 5:01 AM, Ratan Gupta
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1fb0c51e-32a2-1168-1d1d-ac044a5f892c@linux.vnet.ibm.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <p> </p>
      <p class="western" style="margin-bottom: 0cm; line-height: 100%">
        Hi All,<br>
      </p>
      <tt><br>
      </tt><tt>Further to the previous dump proposal, I have
        incorporated the following changes. </tt>
      <ul>
        <li><tt>Having seprate LogService redfish resource for each type
            of dump.</tt><br>
        </li>
      </ul>
      <ul>
        <li><tt>Enhance the LogService(</tt><tt><font color="#000080"><span
                lang="zxx"><u><a
                    href="https://redfish.dmtf.org/schemas/LogService.v1_1_3.json"
                    moz-do-not-send="true">https://redfish.dmtf.org/schemas/LogService.v1_1_3.json</a></u></span></font></tt><tt>)
            property</tt><br>
        </li>
      </ul>
      <tt>       "LogEntryType": {</tt><tt><br>
      </tt><tt> </tt><tt><br>
      </tt><tt>            "enum": [</tt><tt><br>
      </tt><tt>                      "Event",</tt><tt>  </tt><tt><br>
      </tt><tt>                      "SEL",</tt><tt><br>
      </tt><tt>                      "Oem"</tt><tt><br>
      </tt><tt>                      </tt><tt>“</tt><tt><b>Dump</b></tt><tt>”</tt><tt><br>
      </tt><tt>                ] }</tt><tt><br>
      </tt>
      <ul>
        <li><tt>Enhance the LogService under OEM for further subsystem
            type</tt><br>
        </li>
      </ul>
      <tt>      eg: hostboot dump, hypervisor dump</tt><tt><br>
      </tt><tt> </tt><tt><br>
      </tt><tt>        “OEM”: {</tt><tt><br>
      </tt><tt> </tt><tt><br>
      </tt><tt>              “</tt><tt><b>SystemType</b></tt><tt>”: {
        “enum” : [“HostBoot, Hypervisor, etc”] }</tt><tt><br>
      </tt><tt> </tt><tt><br>
      </tt><tt>                } </tt><tt><br>
      </tt>
      <ul>
        <li><tt>Enhance the Log Service for the following<br>
          </tt><tt> <b>Properties</b></tt><tt>:</tt><br>
        </li>
      </ul>
      <blockquote>
        <ol>
          <li><tt><b>DumpOverridePolicy : </b></tt><tt><b>This can be
                different for all different type of dumps.</b></tt></li>
        </ol>
      </blockquote>
    </blockquote>
    <p><br>
    </p>
    <pre class="data">LogService has a OverWritePolicy property, can we use that?</pre>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:1fb0c51e-32a2-1168-1d1d-ac044a5f892c@linux.vnet.ibm.com">
      <blockquote>
        <ol>
          <li><tt><b><tt><b>MaxDumps: This can be different for all
                    different type of dumps.</b></tt></b></tt><tt>    </tt><tt><br>
            </tt></li>
        </ol>
      </blockquote>
    </blockquote>
    <p><tt>LogService has a </tt><tt>MaxNumberOfRecords can we use that
        and drop this?</tt><br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:1fb0c51e-32a2-1168-1d1d-ac044a5f892c@linux.vnet.ibm.com">
      <blockquote>
        <ol>
          <li><tt> </tt></li>
        </ol>
      </blockquote>
      <p><tt>     <b>Actions:</b></tt><br>
      </p>
      <blockquote>
        <ol>
          <li><tt><b>CreateLog:</b></tt><tt><b> If logservice (</b></tt><tt><b>LogEntryType
              </b></tt><tt><b>is Dump) and the subsystem type is
                “Hypervisor” then create log will create a Host
                hypervisor dump.</b></tt></li>
          <li><tt><b> </b></tt><tt><b>DeleteAll: Delete all the logs
                from this log service, This is a addition on the
                deletion of the single resource(LogEntry).</b></tt><br>
          </li>
        </ol>
      </blockquote>
    </blockquote>
    <p><tt>LogService has a </tt><tt> "ClearLog". Can we use that?</tt><br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:1fb0c51e-32a2-1168-1d1d-ac044a5f892c@linux.vnet.ibm.com">
      <blockquote>
        <ol>
          <li> <br>
          </li>
        </ol>
      </blockquote>
      <ul>
        <li><tt>Enhance the logentry<b>(</b><tt><font color="#000080"><span
                  lang="zxx"><u><a
                      href="https://redfish.dmtf.org/schemas/LogEntry.v1_5_0.json"
                      moz-do-not-send="true"><b>https://redfi</b></a></u></span></font><font
                color="#000080"><span lang="zxx"><u><a
                      href="https://redfish.dmtf.org/schemas/LogEntry.v1_5_0.json"
                      moz-do-not-send="true"><b>sh.dmtf.org/schemas/LogEntry.v1_5_0.json</b></a></u></span></font></tt><tt><b>)</b></tt></tt></li>
      </ul>
      <tt> </tt><tt>       "LogEntryType": {</tt><tt><br>
      </tt><tt>            "enum": [</tt><tt><br>
      </tt><tt>                      "Event",</tt><tt>  </tt><tt><br>
      </tt><tt>                      "SEL",</tt><tt><br>
      </tt><tt>                      "Oem"</tt><tt><br>
      </tt><tt>                      </tt><tt>“</tt><tt><b>Dump</b></tt><tt>”</tt><tt><br>
      </tt><tt>                ] }</tt>
      <ul>
        <li><tt>Map the proposed dump properties with existing log entry
            property</tt></li>
        <ul>
          <li><tt>Proposed Property           Existing LogEntry Property</tt></li>
          <ul>
            <li><tt>ID                          ID</tt></li>
            <li><tt><tt>Timestamp                   Created</tt></tt></li>
            <li><tt><tt><tt>Reason                      LogEntryCode</tt><tt>
                    (Introduce more enums in the LogEntry Code for the
                    dump                         reason)</tt></tt></tt><br>
            </li>
          </ul>
        </ul>
      </ul>
      <ul>
        <li><tt><tt>New Properties to be introduced in the logEntry</tt></tt></li>
        <ul>
          <li><tt><b>Size</b></tt></li>
        </ul>
      </ul>
    </blockquote>
    <p><br>
    </p>
    <p>Redfish size properties typically have the unit in the name.</p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:1fb0c51e-32a2-1168-1d1d-ac044a5f892c@linux.vnet.ibm.com">
      <ul>
        <ul>
          <li><tt><b>NOTE: </b>Dump type is not needed as the
              logservice logentry type will tell that this service is
              for dump and the system type will tell that this service
              is for which subsytem.</tt><br>
          </li>
        </ul>
      </ul>
      <tt><b>NOTE: </b></tt><tt> </tt><tt><br>
      </tt><tt> </tt><tt><br>
      </tt><tt><b>1/ OdataID of log entry redfish resourc</b></tt><tt><b>e</b></tt><tt><b>
          will point to the raw dump file which can be used to offload
          the dump.</b></tt><tt><br>
      </tt><tt> </tt><tt><br>
      </tt><tt><b>2/ CreateLog: </b></tt><tt><b>spawns a task and
          returns the taskID.Client can query the status for the task.</b></tt><tt><br>
      </tt><tt> </tt><tt><br>
      </tt><tt> </tt><tt><br>
      </tt><tt> Please let me know if I have missed something else.I
        would be making the change in the PPT also.</tt><br>
      <p class="western" style="margin-bottom: 0cm; font-weight: normal;
        line-height: 100%"> Regards</p>
      <p class="western" style="margin-bottom: 0cm; font-weight: normal;
        line-height: 100%"> Ratan Gupta</p>
      <p>
        <style type="text/css">p { margin-bottom: 0.25cm; direction: ltr; color: rgb(0, 0, 10); line-height: 120%; text-align: left; }p.western { font-family: "Liberation Serif", serif; font-size: 12pt; }p.cjk { font-family: "Noto Sans CJK SC Regular"; font-size: 12pt; }p.ctl { font-family: "FreeSans"; font-size: 12pt; }a:link { }</style></p>
      <div class="moz-cite-prefix">On 10/01/20 1:37 AM, Gunnar Mills
        wrote:<br>
      </div>
      <blockquote type="cite"
        cite="mid:62d0d9ee-ab0c-7ec9-403d-dc9487872142@linux.vnet.ibm.com">
        <meta http-equiv="Content-Type" content="text/html;
          charset=UTF-8">
        <p>A couple comments. <br>
        </p>
        <div class="moz-cite-prefix">On 1/7/2020 2:08 PM, Bills, Jason M
          wrote:<br>
        </div>
        <blockquote type="cite"
          cite="mid:a281f9ca-9dc7-9e7a-8e87-08a313d43fe9@linux.intel.com">
          <br>
          On 1/7/2020 2:11 AM, Ratan Gupta wrote: <br>
          <br>
          <blockquote type="cite">
            <blockquote type="cite"> <br>
              <blockquote type="cite"> <br>
                On Sat, Dec 14, 2019 at 10:57 AM dhruvaraj S <a
                  class="moz-txt-link-rfc2396E"
                  href="mailto:dhruvaraj@gmail.com"
                  moz-do-not-send="true">&lt;dhruvaraj@gmail.com&gt;</a>
                wrote: <br>
                <blockquote type="cite"> <br>
                  On Sat, Dec 14, 2019 at 1:32 AM Bills, Jason M <br>
                  <a class="moz-txt-link-rfc2396E"
                    href="mailto:jason.m.bills@linux.intel.com"
                    moz-do-not-send="true">&lt;jason.m.bills@linux.intel.com&gt;</a>
                  wrote: <br>
                  <blockquote type="cite"> <br>
                    I like this as well.  I'm trying to support a CPU
                    crashdump that would <br>
                    fit perfectly with this proposal. <br>
                    <br>
                    A question and some comments below: <br>
                    <br>
                    Will Dump only have the two types: BMC and Host? 
                    Could this be more <br>
                    flexible to allow for multiple different types of
                    dumps from various <br>
                    components? <br>
                  </blockquote>
                  + I think dump types should be flexible to cover
                  different types of <br>
                  host or bmc dumps from different components with
                  varying formats. <br>
                </blockquote>
              </blockquote>
            </blockquote>
            Sure we can enhance the type of dump, it is enum in the
            proposal which can be enhanced. <br>
            What could be other dump type which I can add in the types?
            <br>
          </blockquote>
        </blockquote>
        <p>Slide 15:  Since DumpType is an enum, should reason be as
          well? "Type" is a pretty typical enum in Redfish. E.g.
          BaseModuleType from <a class="moz-txt-link-freetext"
            href="https://redfish.dmtf.org/schemas/Memory.v1_8_0.json"
            moz-do-not-send="true">https://redfish.dmtf.org/schemas/Memory.v1_8_0.json</a><br>
          <br>
          Reason seems similar to the <span class="treeLabel
            objectLabel" aria-labelledby="default" data-level="1">LogEntryCode
            from</span> <a class="moz-txt-link-freetext"
            href="https://redfish.dmtf.org/schemas/LogEntry.v1_5_0.json"
            moz-do-not-send="true">https://redfish.dmtf.org/schemas/LogEntry.v1_5_0.json</a><br>
          <br>
          Slide 15: <br>
          "Size": 108944B<br>
          Redfish size properties typically have the unit in the name.
          E.g. From <a class="moz-txt-link-freetext"
            href="https://redfish.dmtf.org/schemas/Memory.v1_8_0.json"
            moz-do-not-send="true">https://redfish.dmtf.org/schemas/Memory.v1_8_0.json</a>
          CacheSizeMiB or CapacityMiB. <br>
          <br>
          odata.context is getting dropped. See <a
            class="moz-txt-link-freetext"
            href="https://github.com/DMTF/Redfish/issues/2722"
            moz-do-not-send="true">https://github.com/DMTF/Redfish/issues/2722</a>
          or <a class="moz-txt-link-freetext"
href="https://github.com/DMTF/Redfish/commit/ae49f4fb1278fd435f89317c3fa53cac597e3893#diff-e82b4876efbeaa600d3b104a426f7ac5"
            moz-do-not-send="true">https://github.com/DMTF/Redfish/commit/ae49f4fb1278fd435f89317c3fa53cac597e3893#diff-e82b4876efbeaa600d3b104a426f7ac5</a>
          <br>
        </p>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------ED3974E86C3256C6471E4A3A--

