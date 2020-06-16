Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D241FC103
	for <lists+openbmc@lfdr.de>; Tue, 16 Jun 2020 23:31:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49mhGh6m4WzDqYp
	for <lists+openbmc@lfdr.de>; Wed, 17 Jun 2020 07:31:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=mspinler@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49mhFp4mNlzDqVK
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jun 2020 07:30:53 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05GL4MpC129050; Tue, 16 Jun 2020 17:30:50 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31q4xfsrme-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jun 2020 17:30:49 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05GLJhvY021028;
 Tue, 16 Jun 2020 21:30:49 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02wdc.us.ibm.com with ESMTP id 31pey4e699-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jun 2020 21:30:49 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05GLUmgD34800114
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Jun 2020 21:30:48 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5748F7805C;
 Tue, 16 Jun 2020 21:30:48 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EDD227805F;
 Tue, 16 Jun 2020 21:30:47 +0000 (GMT)
Received: from [9.85.179.235] (unknown [9.85.179.235])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 16 Jun 2020 21:30:47 +0000 (GMT)
Subject: Re: Message registries continuation
To: James Feist <james.feist@linux.intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <74794819-3b3c-0c39-30e0-b2ca6c46d9fb@linux.ibm.com>
 <85015a54-0de6-42e2-bd56-732c7f0a420d@linux.intel.com>
From: Matt Spinler <mspinler@linux.ibm.com>
Message-ID: <025d2742-58e9-1c22-a5cd-0003e6beedc2@linux.ibm.com>
Date: Tue, 16 Jun 2020 16:30:47 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <85015a54-0de6-42e2-bd56-732c7f0a420d@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-16_12:2020-06-16,
 2020-06-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 cotscore=-2147483648 priorityscore=1501
 malwarescore=0 mlxscore=0 mlxlogscore=950 suspectscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006160144
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



On 6/16/2020 3:39 PM, James Feist wrote:
> On 6/16/2020 12:47 PM, Matt Spinler wrote:
>> Hi James,
>>
>> Picking up the discussion again from 
>> https://lists.ozlabs.org/pipermail/openbmc/2020-February/020620.html
>> about reading  in message registries...
>>
>> When this was left off, I believe we were leaning toward being able 
>> to copy message registry JSON files
>> into some target directory on the BMC during the build where bmcweb 
>> would load them on startup
>> and leave them in their JSON objects, and they would be pulled from 
>> there when LogService requests
>> were made.
>>
>> This was to be able to support multiple languages, and in general 
>> just to support other registries besides
>> the existing OpenBMC one that is hardcoded in a header file. (We're 
>> going to have an IBM registry we
>> use together with our D-Bus logs based LogService.)
>
> There's 3 registries, fwiw: 
> https://github.com/openbmc/bmcweb/tree/master/redfish-core/include/registries
>

Do you want these 3 to remain as header files, or be read from the JSON 
as well?  The base one I can get
as JSON already, and I guess I could write a script to convert the other 
2 if necessary.

>>
>> An open issue we still had was if these registries had to be 
>> validated, or if that was left to whoever
>> made them.  A stake in the ground could be that we leave the OpenBMC 
>> registry as it is in a header
>> file, which negates validation, or put it in JSON too and validate 
>> just that one during the build.
>> Or if there are any other ideas here...
>
> Entity-manager uses valijson, in that way you could validate them 
> against a schema: https://github.com/tristanpenman/valijson. It plays 
> nicely with nlohmann-json. Although if these are compiled in json 
> files, I'm not sure it's a large issue. We could just create a 
> compile-time script to validate.
>
>>
>> As far as the directory used, I think that /usr/share/bmcweb/ would 
>> be appropriate, or maybe
>> /usr/share/bmcweb/registries/ if either of those are OK with you.
>
> I think the directory is a good idea so it can load any json file from 
> that directory. Maybe /usr/share/bmcweb/registries/<language> even to 
> make it easier to switch between languages?
>
>>
>> Also, it may be overkill to need to  read in the same registry for 
>> every language, as there could
>> be dozens and realistically they will never all be used on a single 
>> system, but if the desire is only
>> to load them at startup before the current language is known I don't 
>> really see a way around it.
>
> I think this would require a default language and a bmcweb reload if 
> the language changed? Its probably ok to change languages after 
> startup, as long as the default language is loaded immediately to 
> lower the chances of run-time issues. As changing languages is 
> probably a very infrequent operation.
>
>>
>> Thanks!
>> Matt

