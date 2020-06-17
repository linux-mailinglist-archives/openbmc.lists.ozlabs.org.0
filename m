Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6A61FCD14
	for <lists+openbmc@lfdr.de>; Wed, 17 Jun 2020 14:09:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49n3lv1mtZzDqpf
	for <lists+openbmc@lfdr.de>; Wed, 17 Jun 2020 22:09:47 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49n3l11tyNzDqjc
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jun 2020 22:09:00 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05HBXJ6C125004; Wed, 17 Jun 2020 08:08:55 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31q8p49f12-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Jun 2020 08:08:55 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05HC63OC008932;
 Wed, 17 Jun 2020 12:08:52 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma01fra.de.ibm.com with ESMTP id 31q6chrda1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Jun 2020 12:08:52 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 05HC8oV946203320
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Jun 2020 12:08:50 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EFE20AE059;
 Wed, 17 Jun 2020 12:08:49 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A15DAAE051;
 Wed, 17 Jun 2020 12:08:48 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.79.183.75])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 17 Jun 2020 12:08:48 +0000 (GMT)
Subject: Re: Redfish EventService Implementation
To: James Feist <james.feist@linux.intel.com>,
 Patrick Williams <patrick@stwcx.xyz>
References: <019f5263-a7b2-9cb8-4420-cb597bd29afd@gmail.com>
 <b80d18b2bc2766d58158e9c93f05201e87b445cd.camel@fuzziesquirrel.com>
 <c31b2941-dc48-349a-68cf-c5292ccfc621@linux.intel.com>
 <1d2ad757-826d-1993-b88a-e92010b984ed@linux.vnet.ibm.com>
 <05ec7793-2efa-42da-ef56-94cc1477d2bb@linux.intel.com>
 <20200616152428.GA4618@heinlein>
 <7e16df1c-38b0-d488-dbbf-75fe9ac818ab@linux.intel.com>
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Message-ID: <68f31493-6db6-8e8e-8486-e03c14685abe@linux.vnet.ibm.com>
Date: Wed, 17 Jun 2020 17:38:47 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <7e16df1c-38b0-d488-dbbf-75fe9ac818ab@linux.intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-17_03:2020-06-17,
 2020-06-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 clxscore=1015 mlxscore=0 phishscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 cotscore=-2147483648 adultscore=0 malwarescore=0
 mlxlogscore=999 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006170091
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
Cc: "Puli, Apparao" <apparao.puli@linux.intel.com>, "Bills,
 Jason M" <jason.m.bills@linux.intel.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi James,Pattrick.

Thanks for giving the feedback

On 6/16/20 9:41 PM, James Feist wrote:
> On 6/16/2020 8:24 AM, Patrick Williams wrote:
>> On Mon, Jun 15, 2020 at 02:42:11PM -0700, James Feist wrote:
>>> On 6/15/2020 5:50 AM, Ratan Gupta wrote:
>>>>       eg:
>>>>           sd_journal_send("MESSAGE=%s", "Account Modified",
>>>>               "PRIORITY=%i", LOG_INFO, "REDFISH_MESSAGE_ID=%s",
>>>> "REDFISH_RESOURCE_PATH=/redfish/v1/AccountService/accounts/<id>",
>>>>               "REDFISH_RESOURCE_TYPE=ComputerSystem"
>>>> "REDFISH_REGISTRY_PREFIX=Task/Base/Resource/Oem",
>>>>               "REDFISH_MESSAGE_ARGS=%s", "Off", NULL);
>>>
>>> If we're going to go down the path of re-implementing logging, I think
>>> the goal should be to stop logging things in the Journal that are
>>> Redfish specific, and instead log them in some generic format that
>>> phosphor logging controls the map. Right now we are bifurcated because
>>> the dbus-event-logs, SEL, PEL, and Redfish are all using different
>>> methods of logging, that play to their own set of rules.
>>
>> Absolutely agree with you here.  There is zero reason that applications
>> should start logging specially formed messages with REDFISH_* meta-data.
>> We shouldn't have any applications explicitly know about Redfish except
>> the Redfish providers themselves.  This is no different from IPMI, PLDM,
>> or any other external interface.
>>
>> The kind of information presented here as being interesting to expose
>> via Redfish is equally as interesting to me to be able to add to one of
>> our 'FFDC dumps', which could be used for security / forensic work.
>>
>>> Most repos use
>>> phosphor-logging, so instead of creating yet another daemon, if we 
>>> added
>>> support to create a 'System Level' or 'External User' log that has
>>> predefined dictionaries of required and optional keys, something like
>>> phosphor-dbus-interfaces, we might be able to drop some of these
>>> transport specific logs, and have the transports based on the same
>>> database (the journal). Then each transport could filter these based on
>>> journal entry type, and transform them into the correct log for that
>>> transport. I think adding more Redfish specifics into the logs hinders
>>> those who do not want Redfish in their systems.
>>
>> Can't we do this already today by defining a simple errors/metadata file
>> in phosphor-dbus-interfaces and calling 'logging::report<...>' on it?
>> This will create a record on dbus in phosphor-logging.
>>
> I think the original concern was with supporting on the order of 
> 10,000 log entries, having this on d-bus seemed impractical. Also the 
> free log rotation the journal provides is useful. Now modifying the 
> logging::report<...> to conditionally log to the journal seems realistic.
My intention was not to re-implement the logging, my intention was to 
extend/use the existing design which we already have it below.

https://github.com/openbmc/docs/blob/master/architecture/redfish-logging-in-bmcweb.md

I was trying not to bring the Redfish specific stuff in each individual 
repo, instead each transport can listen for
Dbus events and write to the journal which goes to their app specific file.

Your point is valid that we would be polluting the journal if each and 
every transport start writing as per their needs.

***** As per the Redfish one of the requirement is we need the log for 
most of the Dbus Property update/interface added as they
are mapped to some Redfish Resource and the bmcweb has to send the 
Resource updated/modified signal to the
Redfish client. ******

As we are in agreement that we want to use the journal for persistence 
and log rotate feature.

We have two options:
     1) Each transport interface listens for the Dbus signals and write 
it to their app specific file.
     2) Each openbmc repo must use log::report for each D-bus property 
update/ interface added.
        To make this happen, we need the following
         * common message format which can be used by the all other 
application (SEL,Redfish) etc.
         * Transport application will read this common message from the 
journal and use it as per their needs.

Option no 2:   It is ideal solution but that requires good amount of 
work as
              either each and every D-bus repo  should write to the 
journal for any property update/interface added.
                      or
              Should SDbusplus do this as each and every application 
uses the sdbusplus framework to manage the dbus objects

Please let me know your thoughts.

Ratan

