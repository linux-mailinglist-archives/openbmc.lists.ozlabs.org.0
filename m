Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A21FA1F981C
	for <lists+openbmc@lfdr.de>; Mon, 15 Jun 2020 15:18:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49lsMV0bqWzDqHH
	for <lists+openbmc@lfdr.de>; Mon, 15 Jun 2020 23:17:58 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49lrm44MwHzDqC0
 for <openbmc@lists.ozlabs.org>; Mon, 15 Jun 2020 22:50:43 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05FBWN7n143738; Mon, 15 Jun 2020 08:50:36 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31np7bhd9b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 08:50:36 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05FCnrCF022581;
 Mon, 15 Jun 2020 12:50:34 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma02fra.de.ibm.com with ESMTP id 31mpe89f99-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 12:50:34 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05FCoWLJ54984802
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Jun 2020 12:50:32 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 161984C040;
 Mon, 15 Jun 2020 12:50:32 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9EDBB4C052;
 Mon, 15 Jun 2020 12:50:30 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.79.190.152])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 15 Jun 2020 12:50:30 +0000 (GMT)
Subject: Re: Redfish EventService Implementation
To: James Feist <james.feist@linux.intel.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 "Puli, Apparao" <apparao.puli@linux.intel.com>,
 openbmc@lists.ozlabs.org, apparao.puli@linux.intel.com
References: <019f5263-a7b2-9cb8-4420-cb597bd29afd@gmail.com>
 <b80d18b2bc2766d58158e9c93f05201e87b445cd.camel@fuzziesquirrel.com>
 <c31b2941-dc48-349a-68cf-c5292ccfc621@linux.intel.com>
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Message-ID: <1d2ad757-826d-1993-b88a-e92010b984ed@linux.vnet.ibm.com>
Date: Mon, 15 Jun 2020 18:20:29 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <c31b2941-dc48-349a-68cf-c5292ccfc621@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-15_01:2020-06-15,
 2020-06-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 mlxlogscore=999 priorityscore=1501 impostorscore=0 clxscore=1011
 cotscore=-2147483648 mlxscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006150093
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
Cc: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi James/Apparao/Brad,

I am inclining towards having a separate application for Redfish 
Logs(like: phosphor-sel-logger),
This application does the following.

1) Have the mapping info from Redfish resources to Dbus Resources
      * This is needed as webserver have to provide the event filtering 
through Resource Type
      * eg : Redfish Client may ask as the client is interested in 
"Account" Resource type
             i.e all the user account related updates should be given to 
redfish client.
             which suggest that there should be mapping from Redfish 
Resource to Dbus Resource

2) Have the reverse mapping from Dbus Resources to Redfish Resources
      * This is needed to send the Redfish event if there is any changes 
in the
        corresponding D-bus resources. eg BMC state change/network 
change etc.

3) This application monitors the D-bus event and Log the event in the 
journal like below
     eg:
         sd_journal_send("MESSAGE=%s", "Account Modified",
             "PRIORITY=%i", LOG_INFO, "REDFISH_MESSAGE_ID=%s",
"REDFISH_RESOURCE_PATH=/redfish/v1/AccountService/accounts/<id>",
             "REDFISH_RESOURCE_TYPE=ComputerSystem"
             "REDFISH_REGISTRY_PREFIX=Task/Base/Resource/Oem",
             "REDFISH_MESSAGE_ARGS=%s", "Off", NULL);

4) rsyslogd will put all these logs from journal into "/var/log/redfish" 
file.

5) bmcweb/webserver would inotify this file location and on notification 
it will send redfish event

6) Event filtering would be done at the bmcweb/webserver side.


We already have the infrastructure for seq no 4 and seq no 5 and we 
wanted to leverage this infrastructure.

Please let me know if there is any concern with this approach.

Ratan

On 6/9/20 6:28 AM, James Feist wrote:
> On 6/8/2020 2:08 PM, Brad Bishop wrote:
>> On Sat, 2020-02-01 at 02:23 +0530, RAJESWARAN THILLAIGOVINDAN wrote:
>>> Hi,
>>>
>>> I am going through the bmcweb code for implementing Redfish
>>> EventService based on the design document
>>> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/24749. This design
>>> is hooked to the journal based Redfish Event Logging.
>>
>> Would anyone else be willing to opine on whether or not they think
>> journal based event schemes are what we want going forward for OpenBMC?
>>
>> My feeling is that they are not - as an alternative IPC mechanism don't
>> we end up re-implementing things that DBus already does? Doesn't it
>> require us to raise the same event twice everywhere (Once with DBus, and
>> once in the journal)?  What does journal based eventing do that DBus
>> signals don't do?
>
> We don't host log events on DBus at all, so there is no duplicate. The 
> journal gives built in persistence and rotating of logs for large 
> number of events. I know when this came up the last time one of the 
> big issues was supporting thousands of logs wouldn't work well on DBus.
>
>
>>
>> Please poke holes.
>>
>> thx - brad
>>
