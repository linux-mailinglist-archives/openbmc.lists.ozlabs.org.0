Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 153DD22B034
	for <lists+openbmc@lfdr.de>; Thu, 23 Jul 2020 15:17:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCCXm5B6szDqs8
	for <lists+openbmc@lfdr.de>; Thu, 23 Jul 2020 23:16:56 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCCVv3RylzDqlf
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jul 2020 23:15:19 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06ND378K102059; Thu, 23 Jul 2020 09:15:13 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32fat1s387-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jul 2020 09:15:13 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06ND9Xqd028077;
 Thu, 23 Jul 2020 13:15:11 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 32brq7p6yk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jul 2020 13:15:11 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 06NDDjeA52691228
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Jul 2020 13:13:45 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3843A4C050;
 Thu, 23 Jul 2020 13:15:09 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0E0B54C04E;
 Thu, 23 Jul 2020 13:15:08 +0000 (GMT)
Received: from Deepaks-MacBook-Pro.local (unknown [9.79.242.186])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 23 Jul 2020 13:15:07 +0000 (GMT)
Subject: Re: Question about OpenBMC Remote BIOS configuration proposal
To: "Chang, Abner (HPS SW/FW Technologist)" <abner.chang@hpe.com>,
 "suryakanth.sekar@linux.intel.com" <suryakanth.sekar@linux.intel.com>
References: <CS1PR8401MB11440816B91B39DAD21E3CB2FF760@CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM>
 <687ea1e8-4abf-cc90-6777-a56a2416b08b@linux.vnet.ibm.com>
 <CS1PR8401MB11443999B40B22F4B97689EEFF760@CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM>
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Message-ID: <e2bf675a-2668-4228-fde5-2c1fbd0f9caa@linux.vnet.ibm.com>
Date: Thu, 23 Jul 2020 18:45:07 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CS1PR8401MB11443999B40B22F4B97689EEFF760@CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-23_05:2020-07-23,
 2020-07-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007230093
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

On 23/07/20 6:29 pm, Chang, Abner (HPS SW/FW Technologist) wrote:
> Thanks for the information Deepak,
> 
> I am afraid that once some code is contributed to the open source, then that code could become the standard implementation and used by BMC vendors. To support PLDM or other protocols between BIOS<->BMC result in the different implementations from BMC view point. Shall we standardize the spec and the implementation as well? If we would like to give the flexibility to support BIOS <-> BMC protocols for the remote BIOS configurations, shall we abstract some layers based on Remote BIOS configuration proposal? Thus OpenBMC can provide the generic (the base implementation) code for BIOS <-> BMC protocol and OEM provides the implementation of abstract driver/library?

Hi Abner,

I think the intent of the remote bios config app is aligned with what 
you mention above. The app isn't tied up with any of the protocols - 
IPMI, PLDM, Redfish etc. The abstraction the app relies on is D-Bus, 
which is the the abstraction for several other OpenBMC apps. This app 
will implement the following D-Bus interface - 
https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/BIOSConfig/Manager.interface.yaml. 
This means apps like the IPMI and PLDM daemons have to convert their own 
BIOS formats to this, and apps like webserver will convert between this 
and Redfish.

The D-Bus API I pointed to above was recently merged via this commit :
https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-dbus-interfaces/+/18242/

Regards,
Deepak


