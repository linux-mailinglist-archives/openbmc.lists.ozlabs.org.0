Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D565D2C2
	for <lists+openbmc@lfdr.de>; Tue,  2 Jul 2019 17:24:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dShv13YdzDqXS
	for <lists+openbmc@lfdr.de>; Wed,  3 Jul 2019 01:24:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dShC3FYxzDqW6
 for <openbmc@lists.ozlabs.org>; Wed,  3 Jul 2019 01:24:10 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x62FMxHb118289
 for <openbmc@lists.ozlabs.org>; Tue, 2 Jul 2019 11:24:07 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2tg9d29my6-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 02 Jul 2019 11:24:06 -0400
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Tue, 2 Jul 2019 16:24:06 +0100
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 2 Jul 2019 16:24:02 +0100
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x62FO2Bt55378390
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Jul 2019 15:24:02 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E6AA9C6055;
 Tue,  2 Jul 2019 15:24:01 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7B541C605A;
 Tue,  2 Jul 2019 15:24:01 +0000 (GMT)
Received: from [9.41.179.222] (unknown [9.41.179.222])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  2 Jul 2019 15:24:01 +0000 (GMT)
Subject: Re: fsi/sbefifo problems on bmc
To: Ivan Mikhaylov <i.mikhaylov@yadro.com>, cbostic@linux.vnet.ibm.com
References: <ce4ba08f8d44c5e3d1f8a549578ce23c2311f39d.camel@yadro.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Tue, 2 Jul 2019 10:24:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <ce4ba08f8d44c5e3d1f8a549578ce23c2311f39d.camel@yadro.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19070215-0004-0000-0000-00001523309D
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011366; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01226419; UDB=6.00645656; IPR=6.01007640; 
 MB=3.00027555; MTD=3.00000008; XFM=3.00000015; UTC=2019-07-02 15:24:04
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19070215-0005-0000-0000-00008C4DAFDA
Message-Id: <e76b6c0d-f822-18f3-a5f6-6e69e50ec390@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-02_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907020166
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
Cc: Alexander Amelkin <a.amelkin@yadro.com>, openbmc@lists.ozlabs.org,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 6/26/19 11:03 AM, Ivan Mikhaylov wrote:
> Hello Chris, Eddie, we're in the process of bringup of a P9 machine with openbmc
> and we have a problem related to fsi and sbefifo as it appears.
>
> There are some debug data from journalctl about what's happening with sbefifo
> and fsi.
>
>
> Jun 25 09:49:08 nicole phosphor-host-state-manager[1147]: Host State transaction
> request
> Jun 25 09:49:10 nicole kernel: sbefifo 00:00:00:06: DOWN FIFO Timeout !
> status=00100000


I think FSI is still working here, since you can get the status. Just 
the SBE goes unresponsive I guess. Don't know why.


> Jun 25 09:49:10 nicole systemd[1]: Starting Soft power off of the host...
> Jun 25 09:49:10 nicole systemd[1]: Created slice system-
> phosphor\x2dreboot\x2dhost.slice.
> Jun 25 09:49:10 nicole systemd[1]: Stopped target Host instance 0 crashed.
> Jun 25 09:49:10 nicole systemd[1]: Stopped target Quiesce Target.
> Jun 25 09:49:10 nicole systemd[1]: Reached target Stop Host0 (Pre).
> Jun 25 09:49:10 nicole ipmid[1131]: Command in process, no attention
> Jun 25 09:49:23 nicole phosphor-host-state-manager[1147]: Host State transaction
> request
> Jun 25 09:49:24 nicole systemd[1695]: systemd-hostnamed.service:
> PrivateNetwork=yes is configured, but the kernel does not support network
> namespaces, ignoring.
> Jun 25 09:49:24 nicole systemd[1]: Started Hostname Service.
> Jun 25 09:49:27 nicole ipmid[1131]: Host control timeout hit!
> Jun 25 09:49:27 nicole ipmid[1131]: Failed to deliver host command
> Jun 25 09:49:27 nicole ipmid[1131]: Failed to deliver host command
> Jun 25 09:49:27 nicole phosphor-softpoweroff[1655]: Timeout on host attention,
> continue with power down
> Jun 25 09:49:27 nicole systemd[1]:
> xyz.openbmc_project.Ipmi.Internal.SoftPowerOff.service: Succeeded.
> Jun 25 09:49:27 nicole systemd[1]: Started Soft power off of the host.
> Jun 25 09:49:27 nicole systemd[1]: Reached target Host0 (Stopping).
> Jun 25 09:49:27 nicole systemd[1]: Reached target Host0 (Stopped).
> Jun 25 09:49:27 nicole systemd[1]: Reached target Power0 Off (Pre).
> Jun 25 09:49:27 nicole systemd[1]: Starting Wait for Power0 to turn off...
> Jun 25 09:49:27 nicole systemd[1]: Started Stop Power0.


Looks like power is off here, so FSI should fail below.


> Jun 25 09:49:28 nicole power_control.exe[1051]: PowerControl: setting power up
> SOFTWARE_PGOOD to 0
> Jun 25 09:49:28 nicole kernel: sbefifo 00:00:00:06: Failed to read UP fifo
> status during reset , rc=-19
> Jun 25 09:49:28 nicole kernel: occ-hwmon occ-hwmon.1: failed to get OCC poll
> response: -110
> Jun 25 09:49:28 nicole kernel: occ-hwmon: probe of occ-hwmon.1 failed with error
> -110
> Jun 25 09:49:28 nicole kernel:  slave@00:00: error reading slave registers
> Jun 25 09:49:28 nicole power_control.exe[1051]: PowerControl: setting power up
> BMC_POWER_UP to 0
> Jun 25 09:49:28 nicole systemd[1]: fsi-scan@0.service: Main process exited,
> code=killed, status=15/TERM
> Jun 25 09:49:28 nicole systemd[1]: fsi-scan@0.service: Failed with result
> 'signal'.
>
> On the first run we have no problems with fsi and sbefifo and no issues with
> fifo or problems with switching from SOFTWARE_PGOOD to BMC_POWER_UP. In the
> consequenced reboots we have unresponsive host and only manual powercycle helps.
>
>  From my point of view it seems like the fsi slave became unresponsive which
> resulted in the fifo problem and in problems with other stuff.
> We're looking for some guidance on how to debug that. Maybe some hard fsi reset
> via devmem could help?


I believe Ben H. wrote the coldfire FSI stuff, and much of the SBEFIFO 
driver... cc'ing him to see if he would like to help.

Thanks,

Eddie


> Also maybe some debug output from fsi will help to understand what's going on?
> I saw that there is 'trace_enabled' in coldfire's code but there is no option to
> enable it, or is there another way to do that from some right place?
>
> Thanks,
>
> Ivan.
>

