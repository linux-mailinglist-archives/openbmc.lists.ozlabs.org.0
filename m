Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 968844B29E3
	for <lists+openbmc@lfdr.de>; Fri, 11 Feb 2022 17:14:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JwJby1mtBz3bcB
	for <lists+openbmc@lfdr.de>; Sat, 12 Feb 2022 03:14:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KEIekGyW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=shawnmm@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=KEIekGyW; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JwJbT10WWz3bPR
 for <openbmc@lists.ozlabs.org>; Sat, 12 Feb 2022 03:14:28 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21BFn11N012712
 for <openbmc@lists.ozlabs.org>; Fri, 11 Feb 2022 16:14:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 message-id : date : mime-version : subject : references : to : from :
 in-reply-to; s=pp1; bh=V89511pGbkX32+NSXBM/E9uImw2mtijQzSZzpe7DLEI=;
 b=KEIekGyWnv93I8mbOjTobFT2En9L5KhTVvPaZI7WFBLBEOPr7RspuTbn7O2Jggc+ATTQ
 355QYeT4cgvNM+Noh3L4JViD0MJRfzozpPayEqs4GB5Xn23Cg2GE6M6H++4zMmnGii4S
 mdCDTshLrxMD5wLt24h4FQEBZOXKJ91MqhByZDiaq6EQfViNBsGlcm5zXKLw8Qzq4ass
 rT92tWbpTCDPQpPVQBQbUatgajXepLdEg+/uuN39BQoViZUQgjMPcVCPLsU8hFSN61jj
 yum75ENRihmBiadYP3rVO3iTcw7312xJxrjZQZP4EBnuVSGK10BZ0K4sr8BaoSx4X5ob XQ== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e5r9bm2hh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 11 Feb 2022 16:14:26 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21BGDQJs002080
 for <openbmc@lists.ozlabs.org>; Fri, 11 Feb 2022 16:14:25 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02dal.us.ibm.com with ESMTP id 3e3gq1yvy2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 11 Feb 2022 16:14:25 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21BGEO4l33816980
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Fri, 11 Feb 2022 16:14:24 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4310178076
 for <openbmc@lists.ozlabs.org>; Fri, 11 Feb 2022 16:14:24 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1B81F7805F
 for <openbmc@lists.ozlabs.org>; Fri, 11 Feb 2022 16:14:24 +0000 (GMT)
Received: from [9.211.142.23] (unknown [9.211.142.23])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Fri, 11 Feb 2022 16:14:24 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------D020imUVrg7NobofCt0qMBtC"
Message-ID: <14b53f19-b497-27d2-e96a-b2534e8dabac@linux.ibm.com>
Date: Fri, 11 Feb 2022 10:14:23 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Fwd: meta-phosphor/sensors and phosphor-power/phosphor-regulators
 compatibility
Content-Language: en-US
References: <d6a47057-b5a5-e448-001c-d278101f28d6@linux.ibm.com>
To: openbmc@lists.ozlabs.org
From: Shawn McCarney <shawnmm@linux.ibm.com>
In-Reply-To: <d6a47057-b5a5-e448-001c-d278101f28d6@linux.ibm.com>
X-Forwarded-Message-Id: <d6a47057-b5a5-e448-001c-d278101f28d6@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: bJtGJJGBC4cY1axGBXxVEMwvjUSokgi7
X-Proofpoint-ORIG-GUID: bJtGJJGBC4cY1axGBXxVEMwvjUSokgi7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-11_05,2022-02-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 adultscore=0 mlxscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 impostorscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202110088
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
--------------D020imUVrg7NobofCt0qMBtC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Forgot to cc the list of this reponse

-------- Forwarded Message --------
Subject: 	Re: meta-phosphor/sensors and 
phosphor-power/phosphor-regulators compatibility
Date: 	Fri, 11 Feb 2022 09:46:09 -0600
From: 	Shawn McCarney <shawnmm@linux.ibm.com>
To: 	Mike Jones <proclivis@gmail.com>



Hi,
> I think meta-phosphor/sensors and phosphor-power/phosphor-regulators 
> interfere with each other.
>
> When I power on chassis, journalctl shows errors from 
> phosphor-regulators saying the device or resource is busy and mentions 
> the correct i2c. It stops trying after a few attempts. Looking at the 
> code, I see that phosphor-regulators is using /dev/i2c.
>
> At the time of chassis on, the i2c has traffic on the bus, from sensors.
>
> Is there a way to make these play nice?
>
Hi,

If dbus-sensors requires use of a device driver, I'm not sure if both 
applications can read sensors from the same regulator at the same time.  
As noted in my other response, phosphor-regulators communicates directly 
with the regulator via i2c-dev.  That is because most regulator drivers 
don't support regulator configuration, which is one of the key functions 
of phosphor-regulators.

phosphor-regulators supports the following sensor types: iout, 
iout_peak, iout_valley, pout, temperature, temperature_peak, vout, 
vout_peak, vout_valley.  Does that cover the ones you want to read?  If 
so, could you switch to doing all of your sensor readings from 
phosphor-regulators?

Otherwise, if each application is missing one or two key sensors, 
perhaps dbus-sensors or phosphor-regulators could be enhanced to provide 
the missing ones?  I'm pretty booked right now, but contributions are 
welcome.

Long term, it would be ideal for phosphor-regulators to move to 
driver-based communication.  That would avoid this issue.  I think we 
would need define a new regulator device driver framework that provided 
full configuration capability.  It would need to support not just PMBus 
configuration but use of manufacturer-specific interfaces or registers.  
Last time I read about it, the Linux framework provided only very 
limited configuration and was not intended to be used by user-space 
applications.

Thanks,

Shawn

--------------D020imUVrg7NobofCt0qMBtC
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Forgot to cc the list of this reponse<br>
    </p>
    <div class="moz-forward-container">-------- Forwarded Message
      --------
      <table class="moz-email-headers-table" cellspacing="0"
        cellpadding="0" border="0">
        <tbody>
          <tr>
            <th valign="BASELINE" nowrap="nowrap" align="RIGHT">Subject:
            </th>
            <td>Re: meta-phosphor/sensors and
              phosphor-power/phosphor-regulators compatibility</td>
          </tr>
          <tr>
            <th valign="BASELINE" nowrap="nowrap" align="RIGHT">Date: </th>
            <td>Fri, 11 Feb 2022 09:46:09 -0600</td>
          </tr>
          <tr>
            <th valign="BASELINE" nowrap="nowrap" align="RIGHT">From: </th>
            <td>Shawn McCarney <a class="moz-txt-link-rfc2396E" href="mailto:shawnmm@linux.ibm.com">&lt;shawnmm@linux.ibm.com&gt;</a></td>
          </tr>
          <tr>
            <th valign="BASELINE" nowrap="nowrap" align="RIGHT">To: </th>
            <td>Mike Jones <a class="moz-txt-link-rfc2396E" href="mailto:proclivis@gmail.com">&lt;proclivis@gmail.com&gt;</a></td>
          </tr>
        </tbody>
      </table>
      <br>
      <br>
      Hi,<br>
      <blockquote type="cite">I think meta-phosphor/sensors and
        phosphor-power/phosphor-regulators interfere with each other.<br>
        <br>
        When I power on chassis, journalctl shows errors from
        phosphor-regulators saying the device or resource is busy and
        mentions the correct i2c. It stops trying after a few attempts.
        Looking at the code, I see that phosphor-regulators is using
        /dev/i2c.<br>
        <br>
        At the time of chassis on, the i2c has traffic on the bus, from
        sensors.<br>
        <br>
        Is there a way to make these play nice?<br>
        <br>
      </blockquote>
      Hi,<br>
      <br>
      If dbus-sensors requires use of a device driver, I'm not sure if
      both applications can read sensors from the same regulator at the
      same time.  As noted in my other response, phosphor-regulators
      communicates directly with the regulator via i2c-dev.  That is
      because most regulator drivers don't support regulator
      configuration, which is one of the key functions of
      phosphor-regulators.<br>
      <br>
      phosphor-regulators supports the following sensor types: iout,
      iout_peak, iout_valley, pout, temperature, temperature_peak, vout,
      vout_peak, vout_valley.  Does that cover the ones you want to
      read?  If so, could you switch to doing all of your sensor
      readings from phosphor-regulators?<br>
      <br>
      Otherwise, if each application is missing one or two key sensors,
      perhaps dbus-sensors or phosphor-regulators could be enhanced to
      provide the missing ones?  I'm pretty booked right now, but
      contributions are welcome.<br>
      <br>
      Long term, it would be ideal for phosphor-regulators to move to
      driver-based communication.  That would avoid this issue.  I think
      we would need define a new regulator device driver framework that
      provided full configuration capability.  It would need to support
      not just PMBus configuration but use of manufacturer-specific
      interfaces or registers.  Last time I read about it, the Linux
      framework provided only very limited configuration and was not
      intended to be used by user-space applications.<br>
      <br>
      Thanks,<br>
      <br>
      Shawn<br>
      <br>
    </div>
  </body>
</html>

--------------D020imUVrg7NobofCt0qMBtC--

