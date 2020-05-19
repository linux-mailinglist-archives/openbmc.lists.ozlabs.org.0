Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E193B1DA3A3
	for <lists+openbmc@lfdr.de>; Tue, 19 May 2020 23:31:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49RTbc6WDyzDr5j
	for <lists+openbmc@lfdr.de>; Wed, 20 May 2020 07:31:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=gmills@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49RTZb5WDMzDr28
 for <openbmc@lists.ozlabs.org>; Wed, 20 May 2020 07:30:46 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04JL4Ecn189173
 for <openbmc@lists.ozlabs.org>; Tue, 19 May 2020 17:30:43 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 312wsjard6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 19 May 2020 17:30:40 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 04JLThMZ028549
 for <openbmc@lists.ozlabs.org>; Tue, 19 May 2020 21:30:35 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03wdc.us.ibm.com with ESMTP id 313wne6n8u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 19 May 2020 21:30:35 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04JLUXa812387046
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Tue, 19 May 2020 21:30:33 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 913FA6E056
 for <openbmc@lists.ozlabs.org>; Tue, 19 May 2020 21:30:34 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AE9BE6E054
 for <openbmc@lists.ozlabs.org>; Tue, 19 May 2020 21:30:33 +0000 (GMT)
Received: from [9.206.139.110] (unknown [9.206.139.110])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Tue, 19 May 2020 21:30:33 +0000 (GMT)
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
Subject: Redfish update (2020.1 and WIP proposals)
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Message-ID: <e1425b13-880c-2a6c-d9a9-409fed6aebdd@linux.vnet.ibm.com>
Date: Tue, 19 May 2020 16:30:31 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------BF4D04D900E25047E43C8005"
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-19_09:2020-05-19,
 2020-05-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 lowpriorityscore=0 cotscore=-2147483648 suspectscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0
 adultscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2005190179
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
--------------BF4D04D900E25047E43C8005
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Redfish released 2020.1 last week, an overview can be found here: 
https://www.dmtf.org/sites/default/files/Redfish_Release_2020.1_Overview.pdf


It has features like Factory Reset (called ResetToDefaults in Redfish) 
and Auto Reboot (called AutomaticRetry) that OpenBMC uses. Pushed a 
commit to move bmcweb to 2020.1 here: 
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/32188


Was seeing Redfish validator errors, that required a fix to the 
validator. This fix was part of the Redfish-Service-Validators 1.3.6 
release so after this 2020.1 commit goes in, you will need a version of 
Redfish-Service-Validators 1.3.6 or later. CI uses the master branch of 
Redfish-Service-Validator, which has this fix, so not a problem there.


More information can be found on the forum: 
https://redfishforum.com/thread/323/validator-errors-when-moving-release



Redfish to coincide with the OCP virtual summit last week also released 
several "Work in Progress" proposals.

https://redfishforum.com/thread/305/redfish-ocp-virtual-summit

I encourage you to review these and post feedback if you are interested. 
Some of the WIP proposals:

"Diagnostic Data Logging proposal" - This is the dump proposal by 
OpenBMC, some slight updates from the one proposed on the mailing list.


"Power and Thermal enhancement proposal" - Deprecates the current Power 
and Thermal schemas and replaces with a Power Subsystem schema and a 
Thermal Subsystem schema.  Adds new schemas for Fan and PowerSupply. All 
sensors will now be under the Sensor Collection and linked to the 
resource (e.g. Fan, Power Supply). https://imgur.com/a/evoeKjv


"Serial Console discovery enhancement proposal" - Moves KVM 
(GraphicalConsole in Redfish) and Virtual Media from Manager to under 
System. Adds a SerialConsole object under the System.


"Syslog Configuration proposal" - Managing syslog and rsyslog

- Gunnar


--------------BF4D04D900E25047E43C8005
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p style="color: rgb(14, 16, 26); background: transparent;
      margin-top:0pt; margin-bottom:0pt;"><span style="color: rgb(14,
        16, 26); background: transparent; margin-top:0pt;
        margin-bottom:0pt;;" data-preserver-spaces="true">Redfish
        released 2020.1 last week, an overview can be found here: 
<a class="moz-txt-link-freetext" href="https://www.dmtf.org/sites/default/files/Redfish_Release_2020.1_Overview.pdf">https://www.dmtf.org/sites/default/files/Redfish_Release_2020.1_Overview.pdf</a><br>
      </span></p>
    <p style="color: rgb(14, 16, 26); background: transparent;
      margin-top:0pt; margin-bottom:0pt;"><br>
    </p>
    <p style="color: rgb(14, 16, 26); background: transparent;
      margin-top:0pt; margin-bottom:0pt;"><span style="color: rgb(14,
        16, 26); background: transparent; margin-top:0pt;
        margin-bottom:0pt;;" data-preserver-spaces="true">It has
        features like Factory Reset (called ResetToDefaults in Redfish)
        and Auto Reboot (called AutomaticRetry) that OpenBMC uses.
        Pushed a commit to move bmcweb to 2020.1 here: 
        <a class="moz-txt-link-freetext" href="https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/32188">https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/32188</a></span></p>
    <p style="color: rgb(14, 16, 26); background: transparent;
      margin-top:0pt; margin-bottom:0pt;"><br>
    </p>
    <p style="color: rgb(14, 16, 26); background: transparent;
      margin-top:0pt; margin-bottom:0pt;"><span style="color: rgb(14,
        16, 26); background: transparent; margin-top:0pt;
        margin-bottom:0pt;;" data-preserver-spaces="true">Was seeing
        Redfish validator errors, that required a fix to the validator.
        This fix was part of the Redfish-Service-Validators 1.3.6
        release so after this 2020.1 commit goes in, you will need a
        version of Redfish-Service-Validators 1.3.6 or later. CI uses
        the master branch of Redfish-Service-Validator, which has this
        fix, so not a problem there. </span></p>
    <p style="color: rgb(14, 16, 26); background: transparent;
      margin-top:0pt; margin-bottom:0pt;"><br>
    </p>
    <p style="color: rgb(14, 16, 26); background: transparent;
      margin-top:0pt; margin-bottom:0pt;"><span style="color: rgb(14,
        16, 26); background: transparent; margin-top:0pt;
        margin-bottom:0pt;;" data-preserver-spaces="true">More
        information can be found on the forum:
        <a class="moz-txt-link-freetext" href="https://redfishforum.com/thread/323/validator-errors-when-moving-release">https://redfishforum.com/thread/323/validator-errors-when-moving-release</a></span></p>
    <p style="color: rgb(14, 16, 26); background: transparent;
      margin-top:0pt; margin-bottom:0pt;"><br>
      <br>
    </p>
    <p style="color: rgb(14, 16, 26); background: transparent;
      margin-top:0pt; margin-bottom:0pt;"><span style="color: rgb(14,
        16, 26); background: transparent; margin-top:0pt;
        margin-bottom:0pt;;" data-preserver-spaces="true">Redfish to
        coincide with the OCP virtual summit last week also released
        several "Work in Progress" proposals.<br>
      </span></p>
    <p style="color: rgb(14, 16, 26); background: transparent;
      margin-top:0pt; margin-bottom:0pt;"><span style="color: rgb(14,
        16, 26); background: transparent; margin-top:0pt;
        margin-bottom:0pt;;" data-preserver-spaces="true"><a class="moz-txt-link-freetext" href="https://redfishforum.com/thread/305/redfish-ocp-virtual-summit">https://redfishforum.com/thread/305/redfish-ocp-virtual-summit</a></span></p>
    <p style="color: rgb(14, 16, 26); background: transparent;
      margin-top:0pt; margin-bottom:0pt;"><span style="color: rgb(14,
        16, 26); background: transparent; margin-top:0pt;
        margin-bottom:0pt;;" data-preserver-spaces="true">     </span></p>
    <p style="color: rgb(14, 16, 26); background: transparent;
      margin-top:0pt; margin-bottom:0pt;"><span style="color: rgb(14,
        16, 26); background: transparent; margin-top:0pt;
        margin-bottom:0pt;;" data-preserver-spaces="true">I encourage
        you to review these and post feedback if you are interested.
        Some of the WIP proposals:<br>
        <br>
      </span></p>
    <p style="color: rgb(14, 16, 26); background: transparent;
      margin-top:0pt; margin-bottom:0pt;"><span style="color: rgb(14,
        16, 26); background: transparent; margin-top:0pt;
        margin-bottom:0pt;;" data-preserver-spaces="true">"Diagnostic
        Data Logging proposal" - This is the dump proposal by OpenBMC,
        some slight updates from the one proposed on the mailing list.</span></p>
    <p style="color: rgb(14, 16, 26); background: transparent;
      margin-top:0pt; margin-bottom:0pt;"><br>
    </p>
    <p style="color: rgb(14, 16, 26); background: transparent;
      margin-top:0pt; margin-bottom:0pt;"><span style="color: rgb(14,
        16, 26); background: transparent; margin-top:0pt;
        margin-bottom:0pt;;" data-preserver-spaces="true">"Power and
        Thermal enhancement proposal" - Deprecates the current Power and
        Thermal schemas and replaces with a Power Subsystem schema and a
        Thermal Subsystem schema.  Adds new schemas for Fan and
        PowerSupply. All sensors will now be under the Sensor Collection
        and linked to the resource (e.g. Fan, Power Supply). 
        <a class="moz-txt-link-freetext" href="https://imgur.com/a/evoeKjv">https://imgur.com/a/evoeKjv</a><br>
      </span></p>
    <p style="color: rgb(14, 16, 26); background: transparent;
      margin-top:0pt; margin-bottom:0pt;"><br>
    </p>
    <p style="color: rgb(14, 16, 26); background: transparent;
      margin-top:0pt; margin-bottom:0pt;"><span style="color: rgb(14,
        16, 26); background: transparent; margin-top:0pt;
        margin-bottom:0pt;;" data-preserver-spaces="true">"Serial
        Console discovery enhancement proposal" - Moves KVM
        (GraphicalConsole in Redfish) and Virtual Media from Manager to
        under System. Adds a SerialConsole object under the System.  </span></p>
    <p style="color: rgb(14, 16, 26); background: transparent;
      margin-top:0pt; margin-bottom:0pt;"><br>
    </p>
    <p style="color: rgb(14, 16, 26); background: transparent;
      margin-top:0pt; margin-bottom:0pt;"><span style="color: rgb(14,
        16, 26); background: transparent; margin-top:0pt;
        margin-bottom:0pt;;" data-preserver-spaces="true">"Syslog
        Configuration proposal" - Managing syslog and rsyslog<br>
        <br>
        - Gunnar<br>
      </span></p>
  </body>
</html>

--------------BF4D04D900E25047E43C8005--

