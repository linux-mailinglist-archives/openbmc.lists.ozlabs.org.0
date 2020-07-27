Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 234EE22E825
	for <lists+openbmc@lfdr.de>; Mon, 27 Jul 2020 10:44:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFYJ90mBfzDrqf
	for <lists+openbmc@lfdr.de>; Mon, 27 Jul 2020 18:44:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=dkodihal@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFYGd6M69zDrRW
 for <openbmc@lists.ozlabs.org>; Mon, 27 Jul 2020 18:42:49 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06R8WHB5112872; Mon, 27 Jul 2020 04:42:43 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32hrnkmsbe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jul 2020 04:42:43 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06R8ewvu018678;
 Mon, 27 Jul 2020 08:42:41 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma05fra.de.ibm.com with ESMTP id 32gcqk1769-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jul 2020 08:42:41 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06R8gdh458392612
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Jul 2020 08:42:39 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4F451A405F;
 Mon, 27 Jul 2020 08:42:39 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6FA87A405B;
 Mon, 27 Jul 2020 08:42:37 +0000 (GMT)
Received: from Deepaks-MacBook-Pro.local (unknown [9.79.227.188])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 27 Jul 2020 08:42:37 +0000 (GMT)
Subject: Re: Question about OpenBMC Remote BIOS configuration proposal
To: "Chang, Abner (HPS SW/FW Technologist)" <abner.chang@hpe.com>,
 "suryakanth.sekar@linux.intel.com" <suryakanth.sekar@linux.intel.com>
References: <CS1PR8401MB11440816B91B39DAD21E3CB2FF760@CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM>
 <687ea1e8-4abf-cc90-6777-a56a2416b08b@linux.vnet.ibm.com>
 <CS1PR8401MB11443999B40B22F4B97689EEFF760@CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM>
 <e2bf675a-2668-4228-fde5-2c1fbd0f9caa@linux.vnet.ibm.com>
 <CS1PR8401MB114411126A8EC39A653DB283FF720@CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM>
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Message-ID: <37da1faa-1714-8554-67b9-2c0b4870f32d@linux.vnet.ibm.com>
Date: Mon, 27 Jul 2020 14:12:36 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CS1PR8401MB114411126A8EC39A653DB283FF720@CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-27_04:2020-07-27,
 2020-07-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 mlxscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007270058
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
Cc: "Garrett, Mike \(HPE Server Firmware\)" <mike.garrett@hpe.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Wu,
 Frank \(ISS Firmware\)" <frank.l.wu@hpe.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 27/07/20 12:46 pm, Chang, Abner (HPS SW/FW Technologist) wrote:
> Thanks Deepak, I think I am getting more understand the proposal delineated in this figure.
> 
> RBC daemon and D-Bus to RBC are standardized. However, there are two implementation samples  mentioned in this Doc (for BIOS provisioning/consume and modify settings) based on the RBC design. One is the proprietary format in XML over IPMI, another is PLDM over MCTP. Above are not standardized and could be replaced by OEM/Vendor if they don't like either one.  PLDM daemon is not the standard neither, that is only necessary for PLDM solution.
You're right. Feel free to push a patch if the current doc doesn't make 
it very clear that the proprietary and PLDM formats mentioned are just a 
couple of example flows, and the not the only possible ones.

> For the immediate update scenario, how BMC inform BIOS to update BIOS configurations is not standardized. SMI or other methods could be used to achieve immediate update.

Right, again some kind of interrupt/signal the BMC can send and the BIOS 
can understand.

> Anything I missed?

I believe you have the right understanding.

Regards,
Deepak

> thanks
> Abner
> 
>> -----Original Message-----
>> From: Deepak Kodihalli [mailto:dkodihal@linux.vnet.ibm.com]
>> Sent: Thursday, July 23, 2020 9:15 PM
>> To: Chang, Abner (HPS SW/FW Technologist) <abner.chang@hpe.com>;
>> suryakanth.sekar@linux.intel.com
>> Cc: Garrett, Mike (HPE Server Firmware) <mike.garrett@hpe.com>;
>> openbmc@lists.ozlabs.org; Wu, Frank (ISS Firmware) <frank.l.wu@hpe.com>
>> Subject: Re: Question about OpenBMC Remote BIOS configuration proposal
>>
>> On 23/07/20 6:29 pm, Chang, Abner (HPS SW/FW Technologist) wrote:
>>> Thanks for the information Deepak,
>>>
>>> I am afraid that once some code is contributed to the open source, then
>> that code could become the standard implementation and used by BMC
>> vendors. To support PLDM or other protocols between BIOS<->BMC result in
>> the different implementations from BMC view point. Shall we standardize
>> the spec and the implementation as well? If we would like to give the
>> flexibility to support BIOS <-> BMC protocols for the remote BIOS
>> configurations, shall we abstract some layers based on Remote BIOS
>> configuration proposal? Thus OpenBMC can provide the generic (the base
>> implementation) code for BIOS <-> BMC protocol and OEM provides the
>> implementation of abstract driver/library?
>>
>> Hi Abner,
>>
>> I think the intent of the remote bios config app is aligned with what you
>> mention above. The app isn't tied up with any of the protocols - IPMI, PLDM,
>> Redfish etc. The abstraction the app relies on is D-Bus, which is the the
>> abstraction for several other OpenBMC apps. This app will implement the
>> following D-Bus interface - https://github.com/openbmc/phosphor-dbus-
>> interfaces/blob/master/xyz/openbmc_project/BIOSConfig/Manager.interfa
>> ce.yaml.
>> This means apps like the IPMI and PLDM daemons have to convert their own
>> BIOS formats to this, and apps like webserver will convert between this and
>> Redfish.
>>
>> The D-Bus API I pointed to above was recently merged via this commit :
>> INVALID URI REMOVED
>> 2Dproject.xyz_-23_c_openbmc_phosphor-2Ddbus-2Dinterfaces_-
>> 2B_18242_&d=DwICaQ&c=C5b8zRQO1miGmBeVZ2LFWg&r=_SN6FZBN4Vgi4
>> Ulkskz6qU3NYRO03nHp9P7Z5q59A3E&m=JJHJdlINVSumLttqs0AOt0Vng4_lFU
>> r7ADZSVgn9Alo&s=KIUpmNseEHsbfR9Ozie7e9jqV5qQBVV1Z5LZXUdB7uo&e
>> =
>>
>> Regards,
>> Deepak
>>
> 

