Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F10A9A4445
	for <lists+openbmc@lfdr.de>; Sat, 31 Aug 2019 13:27:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46LDZx36kmzDrHp
	for <lists+openbmc@lfdr.de>; Sat, 31 Aug 2019 21:27:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ratagupt@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46LDZD5t28zDr82
 for <openbmc@lists.ozlabs.org>; Sat, 31 Aug 2019 21:26:26 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7VBLsWB174442
 for <openbmc@lists.ozlabs.org>; Sat, 31 Aug 2019 07:26:20 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2uqn2vnfp7-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Sat, 31 Aug 2019 07:26:20 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ratagupt@linux.vnet.ibm.com>;
 Sat, 31 Aug 2019 12:26:18 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Sat, 31 Aug 2019 12:26:16 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7VBQFTE42860546
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 31 Aug 2019 11:26:15 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6656EA404D;
 Sat, 31 Aug 2019 11:26:15 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 07C6EA4051;
 Sat, 31 Aug 2019 11:26:14 +0000 (GMT)
Received: from [9.102.51.216] (unknown [9.102.51.216])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Sat, 31 Aug 2019 11:26:13 +0000 (GMT)
Subject: Re: How to configure the snmp trap
To: xiuzhi <1450335857@qq.com>, openbmc <openbmc@lists.ozlabs.org>
References: <mailman.1763.1567021708.372.openbmc@lists.ozlabs.org>
 <tencent_2C97DABC4F44BB346BFBDE36@qq.com>
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Date: Sat, 31 Aug 2019 16:56:10 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <tencent_2C97DABC4F44BB346BFBDE36@qq.com>
Content-Type: multipart/alternative;
 boundary="------------0BD4335FEFE013271DFB93DF"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19083111-0012-0000-0000-00000344F290
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19083111-0013-0000-0000-0000217F385C
Message-Id: <352695cd-cee7-ec74-e2d0-87e8b52c5da8@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-31_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908310135
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
--------------0BD4335FEFE013271DFB93DF
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit


On 8/29/2019 4:01 PM, xiuzhi wrote:
> Hi Ratan,
>   I am try to test the snmp trap feature on openbmc 2.8.0-dev.
> There is no more snmp util commands such as snmptrap etc. expect  
>  phosphor-network-snmpconf .

You need to configure the snmp trap endpoint via the REST 
api(phosphor-rest-server),Please look at the configuration command at 
the following link

https://github.com/openbmc/phosphor-snmp/blob/master/docs/snmp-configuration.md

We also had a configuration in phosphor-dbus-monitor where it is 
configured that for which D-bus event, snmp traps need to be sent.

https://github.com/openbmc/phosphor-dbus-monitor/blob/master/src/example/example.yaml

phosphor-dbus-monitor, monitors the D-bus event, and as per the 
phosphor-event configuration,snmp trap is  sent.

Once you configure the SNMP trap endpoint and the phosphor-dbus-event 
then you need to run the  snmptrapd outside the BMC to receive the SNMP 
traps .

You may run the snmptrapd inside the BMC also.

NOTE: Make sure that wherever you are running the snmptrapd, firewall is 
not blocking the packets.
> The document ,
>   https://github.com/openbmc/phosphor-snmp/blob/master/docs/snmp-configuration.md 
> ,  does not guide me to do the snmp trap test.
>   Would you like to give me a detail instruction to do the snmp trap test?
>
> Best,
> Xiuzhi

--------------0BD4335FEFE013271DFB93DF
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/29/2019 4:01 PM, xiuzhi wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:tencent_2C97DABC4F44BB346BFBDE36@qq.com">
      <meta http-equiv="content-type" content="text/html;
        charset=windows-1252">
      <div>Hi Ratan,</div>
      <div>  I am try to test the snmp trap feature on openbmc
        2.8.0-dev.</div>
      <div>There is no more snmp util commands such as snmptrap etc.
        expect   phosphor-network-snmpconf .</div>
    </blockquote>
    <p>You need to configure the snmp trap endpoint via the REST
      api(phosphor-rest-server),Please look at the configuration command
      at the following link</p>
    <p><a class="moz-txt-link-freetext" href="https://github.com/openbmc/phosphor-snmp/blob/master/docs/snmp-configuration.md">https://github.com/openbmc/phosphor-snmp/blob/master/docs/snmp-configuration.md</a></p>
    We also had a configuration in phosphor-dbus-monitor where it is
    configured that for which D-bus event, snmp traps need to be sent.<br>
    <p><a class="moz-txt-link-freetext" href="https://github.com/openbmc/phosphor-dbus-monitor/blob/master/src/example/example.yaml">https://github.com/openbmc/phosphor-dbus-monitor/blob/master/src/example/example.yaml</a></p>
    <p>phosphor-dbus-monitor, monitors the D-bus event, and as per the
      phosphor-event configuration,snmp trap is  sent.</p>
    Once you configure the SNMP trap endpoint and the
    phosphor-dbus-event then you need to run the  snmptrapd outside the
    BMC to receive the SNMP traps .<br>
    <p>You may run the snmptrapd inside the BMC also.</p>
    NOTE: Make sure that wherever you are running the snmptrapd,
    firewall is not blocking the packets.<br>
    <blockquote type="cite"
      cite="mid:tencent_2C97DABC4F44BB346BFBDE36@qq.com">
      <div> The document ,</div>
      <div>  <a class="moz-txt-link-freetext" href="https://github.com/openbmc/phosphor-snmp/blob/master/docs/snmp-configuration.md">https://github.com/openbmc/phosphor-snmp/blob/master/docs/snmp-configuration.md</a>
        ,  does not guide me to do the snmp trap test.</div>
      <div>  Would you like to give me a detail instruction to do the
        snmp trap test?<font face="arial" color="#333333"><span
            style="font-size: 16px;"> </span></font></div>
      <div><font face="arial" color="#333333"><span style="font-size:
            16px;"><br>
          </span></font></div>
      <div><font face="arial" color="#333333"><span style="font-size:
            16px;">Best,</span></font></div>
      <div><font face="arial" color="#333333"><span style="font-size:
            16px;">Xiuzhi</span></font></div>
    </blockquote>
  </body>
</html>

--------------0BD4335FEFE013271DFB93DF--

