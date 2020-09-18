Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FD427024E
	for <lists+openbmc@lfdr.de>; Fri, 18 Sep 2020 18:34:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BtKDN5RLzzDqsG
	for <lists+openbmc@lfdr.de>; Sat, 19 Sep 2020 02:34:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gmills@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=JYk0AAda; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BtK8Z2D4CzDqkw
 for <openbmc@lists.ozlabs.org>; Sat, 19 Sep 2020 02:31:08 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08IGPIBe076305
 for <openbmc@lists.ozlabs.org>; Fri, 18 Sep 2020 12:31:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 message-id : date : mime-version : content-type; s=pp1;
 bh=gSrSuaj40WgyO3MMpsNOKleCWDanG/QizEXJjuqAD7I=;
 b=JYk0AAda0kvQe838SE8IBq3wKtd8FNS/PJwN0qegVh2mOEPk/SDwgb+QPkZNiEY7Ep9u
 cHe/47UQ6EdxZcNhWNZM/XM7BopvMWGo9c/Od7aR7++vGH/6lWklZ1IEQJlsc3OvsyE8
 V6DEdisHDn82g8j5B/8NkE5A4NzJk0jdzORUrv5/q1kwcB+XIz3Pyk6PNmtWoANJw050
 bX5J7I5pX4aYqUSgBRyCA0DrMoaQJiEzA0uVPOIZ78sf7DPTxftpm+K4b/GaB09kQ3+7
 H1C8jHmryA/ZOvxZFj+/fBrQgBPcOf0ksH4IXq4zgsq3gmzE6OJHBjsTJnG1nB07G5iY Ag== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33n0dar34w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 18 Sep 2020 12:31:06 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08IGRtwc025621
 for <openbmc@lists.ozlabs.org>; Fri, 18 Sep 2020 16:31:05 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04wdc.us.ibm.com with ESMTP id 33k6hencd1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 18 Sep 2020 16:31:05 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08IGV4bt41287968
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Fri, 18 Sep 2020 16:31:04 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 70B6DAE05C
 for <openbmc@lists.ozlabs.org>; Fri, 18 Sep 2020 16:31:04 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2B86EAE06B
 for <openbmc@lists.ozlabs.org>; Fri, 18 Sep 2020 16:31:03 +0000 (GMT)
Received: from [9.206.174.152] (unknown [9.206.174.152])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Fri, 18 Sep 2020 16:31:02 +0000 (GMT)
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Proposal to make webui-vue the standard
Message-ID: <29b244dc-5a8b-a82f-b62c-30791d2c0962@linux.vnet.ibm.com>
Date: Fri, 18 Sep 2020 10:31:01 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------9E2EB492585A4F15EE1AA0C7"
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-18_14:2020-09-16,
 2020-09-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 mlxlogscore=503
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009180126
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
--------------9E2EB492585A4F15EE1AA0C7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi All,

From some continued discussion yesterday in the GUI Design Workgroup, we 
would like to see the community move away from phosphor-webuiand for 
webui-vueto become the standard. All companies on the call were in favor 
of this but I’ll let them chime in for themselves.

As stated in previous emails there are many benefits to the webui-vueGUI.
webui-vueadds:

  * Improved user experience based on feedback from OpenBMC users
  * Conformance with the W3C Web Content Accessibility Guidelines 2.1
    specification
  * Ability to easily theme to meet brand guidelines
  * Dynamically generate navigation
  * Language translation-ready
  * Full Redfish
  * Modern front-end framework with an active community and future
    development roadmap

The phosphor-webuifront-end framework, AngularJS, will sunset in June of 
2021. Based on this, the most active contributing companies have moved 
to webui-vueresulting in a decrease of development activity on 
phosphor-webuiover the past six months.
We also believe webui-vueallows us to move forward other areas, for 
example, turning off exposing the D-Bus interfaces as a REST API. This 
change would break phosphor-webui. Since webui-vueuses Redfish this is 
not the case for it. 
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/29344 
<https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/29344>
As requested, below is an updated timeline:
With Virtual Media merged, 8 identified issues to reach parity:
https://github.com/openbmc/webui-vue/issues?q=is%3Aissue+is%3Aopen+label%3Aphosphor-webui-feature-parity 
<https://github.com/openbmc/webui-vue/issues?q=is%3Aissue+is%3Aopen+label%3Aphosphor-webui-feature-parity>
IBM plans to work on, with an estimated completion of mid-October:

  * Two file Firmware upload (#9)
  * Loading webui-vue from the BMC causes content-security-policy errors
    (#32)
  * Radio button for DHCP - Network settings (#36)

And will work on when the Redfish interfaces for these are implemented:

  * Remote Logging (#34)
  * SNMP (#33)

The last 2 identified issues, we are looking for community help but 
might take these up ourselves one day:

  * Mutual TLS (#30)
  * CSRF allow list (#29)

The last issue, Next URL forward (#28) has a review up.  Thanks Mateusz!

Please let us know if we have missed any features needed to reach parity 
with phosphor-webui.

Would any of these outstanding issues keep the community from accepting 
webui-vueas the standard?

Not sure officially making webui-vuethe standard means a lot, we plan to 
update docs/ links to point at webui-vueandview as the first step 
towards eventually deprecating / archiving phosphor-webui.

Is there any objection to this?

Some previous discussion on these topics here:
https://lists.ozlabs.org/pipermail/openbmc/2020-August/022637.html 
<https://lists.ozlabs.org/pipermail/openbmc/2020-August/022637.html>
https://lists.ozlabs.org/pipermail/openbmc/2020-February/020491.html 
<https://lists.ozlabs.org/pipermail/openbmc/2020-February/020491.html>

Thanks,
Derick, Gunnar, and Yoshie

--------------9E2EB492585A4F15EE1AA0C7
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <span style="color: rgb(14, 16, 26); font-size: 12pt; line-height:
      20.5042px;" data-contrast="none" class="TextRun SCXW112069216
      BCX2" lang="EN-US"><span class="NormalTextRun SCXW112069216 BCX2"
        style="background-color: inherit;">Hi All,<br>
      </span></span><span class="EOP SCXW112069216 BCX2"
      style="font-size: 12pt; line-height: 20.5042px; color: rgb(14, 16,
      26);" data-ccp-props="{}"><br>
    </span>
    <div class="OutlineElement Ltr BCX2 SCXW112069216" style="direction:
      ltr;"><span style="color: rgb(14, 16, 26); font-size: 12pt;
        line-height: 20.5042px;" data-contrast="none" class="TextRun
        SCXW112069216 BCX2" lang="EN-US"><span class="NormalTextRun
          SCXW112069216 BCX2" style="background-color: inherit;">From
          some continued discussion yesterday in the GUI Design
          Workgroup, we would like to see the community move away from
          phosphor-</span></span><span style="color: rgb(14, 16, 26);
        font-size: 12pt; line-height: 20.5042px;" data-contrast="none"
        class="TextRun SCXW112069216 BCX2" lang="EN-US"><span
          class="SpellingError SCXW112069216 BCX2"
          style="background-color: inherit;">webui</span></span><span
        style="color: rgb(14, 16, 26); font-size: 12pt; line-height:
        20.5042px;" data-contrast="none" class="TextRun SCXW112069216
        BCX2" lang="EN-US"><span class="NormalTextRun SCXW112069216
          BCX2" style="background-color: inherit;"> and for </span></span><span
        style="color: rgb(14, 16, 26); font-size: 12pt; line-height:
        20.5042px;" data-contrast="none" class="TextRun SCXW112069216
        BCX2" lang="EN-US"><span class="SpellingError SCXW112069216
          BCX2" style="background-color: inherit;">webui-vue</span></span><span
        style="color: rgb(14, 16, 26); font-size: 12pt; line-height:
        20.5042px;" data-contrast="none" class="TextRun SCXW112069216
        BCX2" lang="EN-US"><span class="NormalTextRun SCXW112069216
          BCX2" style="background-color: inherit;"> to become the
          standard. All companies on the call were in favor of this but
          I’ll let them chime in for themselves.</span></span><span
        class="EOP SCXW112069216 BCX2" style="font-size: 12pt;
        line-height: 20.5042px; color: rgb(14, 16, 26);"
        data-ccp-props="{}"></span></div>
    <div class="OutlineElement Ltr BCX2 SCXW112069216" style="direction:
      ltr;"><span style="color: rgb(14, 16, 26); font-size: 12pt;
        line-height: 20.5042px;" data-contrast="none" class="TextRun
        SCXW112069216 BCX2" lang="EN-US"><span class="NormalTextRun
          SCXW112069216 BCX2" style="background-color: inherit;"></span></span><span
        class="EOP SCXW112069216 BCX2" style="font-size: 12pt;
        line-height: 20.5042px; color: rgb(14, 16, 26);"
        data-ccp-props="{}"><br>
      </span></div>
    <div class="OutlineElement Ltr BCX2 SCXW112069216" style="direction:
      ltr;"><span style="color: rgb(14, 16, 26); font-size: 12pt;
        line-height: 20.5042px;" data-contrast="none" class="TextRun
        SCXW112069216 BCX2" lang="EN-US"><span class="NormalTextRun
          SCXW112069216 BCX2" style="background-color: inherit;">As
          stated in previous emails there are many benefits to the </span></span><span
        style="color: rgb(14, 16, 26); font-size: 12pt; line-height:
        20.5042px;" data-contrast="none" class="TextRun SCXW112069216
        BCX2" lang="EN-US"><span class="SpellingError SCXW112069216
          BCX2" style="background-color: inherit;">webui-vue</span></span><span
        style="color: rgb(14, 16, 26); font-size: 12pt; line-height:
        20.5042px;" data-contrast="none" class="TextRun SCXW112069216
        BCX2" lang="EN-US"><span class="NormalTextRun SCXW112069216
          BCX2" style="background-color: inherit;"> GUI.</span></span><span
        class="EOP SCXW112069216 BCX2" style="font-size: 12pt;
        line-height: 20.5042px; color: rgb(14, 16, 26);"
        data-ccp-props="{}"></span></div>
    <div class="SCXW112069216 BCX2">
      <div class="OutlineElement Ltr BCX2 SCXW112069216"
        style="direction: ltr;"><span style="color: rgb(14, 16, 26);
          font-size: 12pt; line-height: 20.5042px;" data-contrast="none"
          class="TextRun SCXW112069216 BCX2" lang="EN-US"><span
            class="SpellingError SCXW112069216 BCX2"
            style="background-color: inherit;">webui-vue</span></span><span
          style="color: rgb(14, 16, 26); font-size: 12pt; line-height:
          20.5042px;" data-contrast="none" class="TextRun SCXW112069216
          BCX2" lang="EN-US"><span class="NormalTextRun SCXW112069216
            BCX2" style="background-color: inherit;"> adds:<br>
          </span></span>
        <ul>
          <li><span style="color: rgb(14, 16, 26); font-size: 12pt;
              line-height: 20.5042px;" data-contrast="none"
              class="TextRun SCXW112069216 BCX2" lang="EN-US"><span
                class="NormalTextRun SCXW112069216 BCX2"
                style="background-color: inherit;">Improved user
                experience based on feedback from OpenBMC users </span></span></li>
          <li><span style="color: rgb(14, 16, 26); font-size: 12pt;
              line-height: 20.5042px;" data-contrast="none"
              class="TextRun SCXW112069216 BCX2" lang="EN-US"><span
                class="NormalTextRun SCXW112069216 BCX2"
                style="background-color: inherit;">Conformance with the
                W3C Web Content Accessibility Guidelines 2.1
                specification </span></span></li>
          <li><span style="color: rgb(14, 16, 26); font-size: 12pt;
              line-height: 20.5042px;" data-contrast="none"
              class="TextRun SCXW112069216 BCX2" lang="EN-US"><span
                class="NormalTextRun SCXW112069216 BCX2"
                style="background-color: inherit;">Ability to easily
                theme to meet brand guidelines </span></span></li>
          <li><span style="color: rgb(14, 16, 26); font-size: 12pt;
              line-height: 20.5042px;" data-contrast="none"
              class="TextRun SCXW112069216 BCX2" lang="EN-US"><span
                class="NormalTextRun SCXW112069216 BCX2"
                style="background-color: inherit;">Dynamically generate
                navigation </span></span></li>
          <li><span style="color: rgb(14, 16, 26); font-size: 12pt;
              line-height: 20.5042px;" data-contrast="none"
              class="TextRun SCXW112069216 BCX2" lang="EN-US"><span
                class="NormalTextRun SCXW112069216 BCX2"
                style="background-color: inherit;">Language
                translation-ready </span></span></li>
          <li><span style="color: rgb(14, 16, 26); font-size: 12pt;
              line-height: 20.5042px;" data-contrast="none"
              class="TextRun SCXW112069216 BCX2" lang="EN-US"><span
                class="NormalTextRun SCXW112069216 BCX2"
                style="background-color: inherit;">Full Redfish </span></span></li>
          <li><span style="color: rgb(14, 16, 26); font-size: 12pt;
              line-height: 20.5042px;" data-contrast="none"
              class="TextRun SCXW112069216 BCX2" lang="EN-US"><span
                class="NormalTextRun SCXW112069216 BCX2"
                style="background-color: inherit;">Modern front-end
                framework with an active community and future
                development roadmap</span></span></li>
        </ul>
        <span style="color: rgb(14, 16, 26); font-size: 12pt;
          line-height: 20.5042px;" data-contrast="none" class="TextRun
          SCXW112069216 BCX2" lang="EN-US"><span class="NormalTextRun
            SCXW112069216 BCX2" style="background-color: inherit;"></span></span><span
          class="EOP SCXW112069216 BCX2" style="font-size: 12pt;
          line-height: 20.5042px; color: rgb(14, 16, 26);"
data-ccp-props="{&quot;335551550&quot;:1,&quot;335551620&quot;:1,&quot;335559740&quot;:259}"></span><span
          style="color: rgb(14, 16, 26); font-size: 12pt; line-height:
          20.5042px;" data-contrast="none" class="TextRun SCXW112069216
          BCX2" lang="EN-US"><span class="NormalTextRun SCXW112069216
            BCX2" style="background-color: inherit;"></span></span><span
          class="EOP SCXW112069216 BCX2" style="font-size: 12pt;
          line-height: 20.5042px; color: rgb(14, 16, 26);"
          data-ccp-props="{}"></span></div>
      <div class="OutlineElement Ltr BCX2 SCXW112069216"
        style="direction: ltr;"><span style="color: rgb(14, 16, 26);
          font-size: 12pt; line-height: 20.5042px;" data-contrast="none"
          class="TextRun SCXW112069216 BCX2" lang="EN-US"><span
            class="NormalTextRun SCXW112069216 BCX2"
            style="background-color: inherit;">The phosphor-</span><span
            class="SpellingError SCXW112069216 BCX2"
            style="background-color: inherit;">webui</span><span
            class="NormalTextRun SCXW112069216 BCX2"
            style="background-color: inherit;"> front-end framework,
            AngularJS, will sunset in June of 2021. Based on this, the
            most active contributing companies have moved to </span><span
            class="SpellingError SCXW112069216 BCX2"
            style="background-color: inherit;">webui-vue</span><span
            class="NormalTextRun SCXW112069216 BCX2"
            style="background-color: inherit;"> resulting in a decrease
            of development activity on phosphor-</span><span
            class="SpellingError SCXW112069216 BCX2"
            style="background-color: inherit;">webui</span><span
            class="NormalTextRun SCXW112069216 BCX2"
            style="background-color: inherit;"> over the past six
            months.</span></span><span class="EOP SCXW112069216 BCX2"
          style="font-size: 12pt; line-height: 20.5042px; color: rgb(14,
          16, 26);" data-ccp-props="{}"> </span></div>
    </div>
    <div class="OutlineElement Ltr BCX2 SCXW112069216" style="direction:
      ltr;"><span style="color: rgb(14, 16, 26); font-size: 12pt;
        line-height: 20.5042px;" data-contrast="none" class="TextRun
        SCXW112069216 BCX2" lang="EN-US"><span class="NormalTextRun
          SCXW112069216 BCX2" style="background-color: inherit;"></span></span><span
        class="EOP SCXW112069216 BCX2" style="font-size: 12pt;
        line-height: 20.5042px; color: rgb(14, 16, 26);"
        data-ccp-props="{}"> </span></div>
    <div class="OutlineElement Ltr BCX2 SCXW112069216" style="direction:
      ltr;"><span style="color: rgb(14, 16, 26); font-size: 12pt;
        line-height: 20.5042px;" data-contrast="none" class="TextRun
        SCXW112069216 BCX2" lang="EN-US"><span class="NormalTextRun
          SCXW112069216 BCX2" style="background-color: inherit;">We also
          believe </span></span><span style="color: rgb(14, 16, 26);
        font-size: 12pt; line-height: 20.5042px;" data-contrast="none"
        class="TextRun SCXW112069216 BCX2" lang="EN-US"><span
          class="SpellingError SCXW112069216 BCX2"
          style="background-color: inherit;">webui-vue</span></span><span
        style="color: rgb(14, 16, 26); font-size: 12pt; line-height:
        20.5042px;" data-contrast="none" class="TextRun SCXW112069216
        BCX2" lang="EN-US"><span class="NormalTextRun SCXW112069216
          BCX2" style="background-color: inherit;"> allows us to move
          forward other areas, for example, turning off exposing the
          D-Bus interfaces as a REST API. This change would break
          phosphor-</span></span><span style="color: rgb(14, 16, 26);
        font-size: 12pt; line-height: 20.5042px;" data-contrast="none"
        class="TextRun SCXW112069216 BCX2" lang="EN-US"><span
          class="SpellingError SCXW112069216 BCX2"
          style="background-color: inherit;">webui</span></span><span
        style="color: rgb(14, 16, 26); font-size: 12pt; line-height:
        20.5042px;" data-contrast="none" class="TextRun SCXW112069216
        BCX2" lang="EN-US"><span class="NormalTextRun SCXW112069216
          BCX2" style="background-color: inherit;">. Since </span></span><span
        style="color: rgb(14, 16, 26); font-size: 12pt; line-height:
        20.5042px;" data-contrast="none" class="TextRun SCXW112069216
        BCX2" lang="EN-US"><span class="SpellingError SCXW112069216
          BCX2" style="background-color: inherit;">webui-vue</span></span><span
        style="color: rgb(14, 16, 26); font-size: 12pt; line-height:
        20.5042px;" data-contrast="none" class="TextRun SCXW112069216
        BCX2" lang="EN-US"><span class="NormalTextRun SCXW112069216
          BCX2" style="background-color: inherit;"> uses Redfish this is
          not the case for it. </span></span><a class="Hyperlink
        SCXW112069216 BCX2" style="text-decoration: none; color:
        inherit;"
        href="https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/29344"
        target="_blank" rel="noreferrer noopener"><span style="color:
          rgb(74, 110, 224); text-decoration: underline; font-size:
          12pt; line-height: 20.5042px;" data-contrast="none"
          class="TextRun Underlined SCXW112069216 BCX2" lang="EN-US"><span
            class="NormalTextRun SCXW112069216 BCX2"
            style="background-color: inherit;"
            data-ccp-charstyle="Hyperlink">https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/29344</span></span></a><span
        style="color: rgb(14, 16, 26); font-size: 12pt; line-height:
        20.5042px;" data-contrast="none" class="TextRun SCXW112069216
        BCX2" lang="EN-US"><span class="NormalTextRun SCXW112069216
          BCX2" style="background-color: inherit;"> </span></span><span
        class="EOP SCXW112069216 BCX2" style="font-size: 12pt;
        line-height: 20.5042px; color: rgb(14, 16, 26);"
        data-ccp-props="{}"> </span></div>
    <div class="OutlineElement Ltr BCX2 SCXW112069216" style="direction:
      ltr;"><span style="color: rgb(14, 16, 26); font-size: 12pt;
        line-height: 20.5042px;" data-contrast="none" class="TextRun
        SCXW112069216 BCX2" lang="EN-US"><span class="NormalTextRun
          SCXW112069216 BCX2" style="background-color: inherit;"> </span></span><span
        class="EOP SCXW112069216 BCX2" style="font-size: 12pt;
        line-height: 20.5042px; color: rgb(14, 16, 26);"
        data-ccp-props="{}"> </span></div>
    <div class="OutlineElement Ltr BCX2 SCXW112069216" style="direction:
      ltr;"><span style="color: rgb(14, 16, 26); font-size: 12pt;
        line-height: 20.5042px;" data-contrast="none" class="TextRun
        SCXW112069216 BCX2" lang="EN-US"><span class="NormalTextRun
          SCXW112069216 BCX2" style="background-color: inherit;">As
          requested, below is an updated timeline: </span></span><span
        class="EOP SCXW112069216 BCX2" style="font-size: 12pt;
        line-height: 20.5042px; color: rgb(14, 16, 26);"
        data-ccp-props="{}"> </span></div>
    <div class="OutlineElement Ltr BCX2 SCXW112069216" style="direction:
      ltr;"><span style="color: rgb(14, 16, 26); font-size: 12pt;
        line-height: 20.5042px;" data-contrast="none" class="TextRun
        SCXW112069216 BCX2" lang="EN-US"><span class="NormalTextRun
          SCXW112069216 BCX2" style="background-color: inherit;"> </span></span><span
        class="EOP SCXW112069216 BCX2" style="font-size: 12pt;
        line-height: 20.5042px; color: rgb(14, 16, 26);"
        data-ccp-props="{}"> </span></div>
    <div class="SCXW112069216 BCX2">
      <div class="OutlineElement Ltr BCX2 SCXW112069216"
        style="direction: ltr;"><span style="color: rgb(14, 16, 26);
          font-size: 12pt; line-height: 20.5042px;" data-contrast="none"
          class="TextRun SCXW112069216 BCX2" lang="EN-US"><span
            class="NormalTextRun SCXW112069216 BCX2"
            style="background-color: inherit;">With Virtual Media
            merged, 8 identified issues to reach parity:  </span></span><span
          class="EOP SCXW112069216 BCX2" style="font-size: 12pt;
          line-height: 20.5042px; color: rgb(14, 16, 26);"
          data-ccp-props="{}"> </span></div>
      <div class="OutlineElement Ltr BCX2 SCXW112069216"
        style="direction: ltr;"><span data-contrast="auto"
          style="font-size: 12pt; line-height: 20.5042px;"
          class="TextRun EmptyTextRun SCXW112069216 BCX2"></span><a
          class="Hyperlink SCXW112069216 BCX2" style="text-decoration:
          none; color: inherit;"
href="https://github.com/openbmc/webui-vue/issues?q=is%3Aissue+is%3Aopen+label%3Aphosphor-webui-feature-parity"
          target="_blank" rel="noreferrer noopener"><span style="color:
            rgb(74, 110, 224); text-decoration: underline; font-size:
            12pt; line-height: 20.5042px;" data-contrast="none"
            class="TextRun Underlined SCXW112069216 BCX2" lang="EN-US"><span
              class="NormalTextRun SCXW112069216 BCX2"
              style="background-color: inherit;"
              data-ccp-charstyle="Hyperlink">https://github.com/openbmc/webui-vue/issues?q=is%3Aissue+is%3Aopen+label%3Aphosphor-webui-feature-parity</span></span></a><span
          style="color: rgb(14, 16, 26); font-size: 12pt; line-height:
          20.5042px;" data-contrast="none" class="TextRun EmptyTextRun
          SCXW112069216 BCX2" lang="EN-US"></span><span class="EOP
          SCXW112069216 BCX2" style="font-size: 12pt; line-height:
          20.5042px; color: rgb(14, 16, 26);" data-ccp-props="{}"> </span></div>
      <div class="OutlineElement Ltr BCX2 SCXW112069216"
        style="direction: ltr;"><span style="color: rgb(14, 16, 26);
          font-size: 12pt; line-height: 20.5042px;" data-contrast="none"
          class="TextRun SCXW112069216 BCX2" lang="EN-US"><span
            class="NormalTextRun SCXW112069216 BCX2"
            style="background-color: inherit;"
            data-ccp-parastyle="heading 1">IBM plans to work on, with an
            estimated completion of mid-October:<br>
          </span></span>
        <ul>
          <li><span class="LineBreakBlob BlobObject DragDrop
              SCXW112069216 BCX2" style="font-size: 12pt; line-height:
              20.5042px;"><span class="SCXW112069216 BCX2"> Two file
                Firmware upload (#9)  </span></span></li>
          <li><span class="LineBreakBlob BlobObject DragDrop
              SCXW112069216 BCX2" style="font-size: 12pt; line-height:
              20.5042px;"><span class="SCXW112069216 BCX2">Loading
                webui-vue from the BMC causes content-security-policy
                errors (#32) </span></span></li>
          <li><span class="LineBreakBlob BlobObject DragDrop
              SCXW112069216 BCX2" style="font-size: 12pt; line-height:
              20.5042px;"><span class="SCXW112069216 BCX2">Radio button
                for DHCP - Network settings (#36) </span></span></li>
        </ul>
        <span style="color: rgb(14, 16, 26); font-size: 12pt;
          line-height: 20.5042px;" data-contrast="none" class="TextRun
          SCXW112069216 BCX2" lang="EN-US"><span class="NormalTextRun
            SCXW112069216 BCX2" style="background-color: inherit;">And
            will work on when the Redfish interfaces for these are
            implemented:</span></span><span class="EOP SCXW112069216
          BCX2" style="font-size: 12pt; line-height: 20.5042px; color:
          rgb(14, 16, 26);" data-ccp-props="{}"><br>
        </span>
        <ul>
          <li><span class="EOP SCXW112069216 BCX2" style="font-size:
              12pt; line-height: 20.5042px; color: rgb(14, 16, 26);"
              data-ccp-props="{}">Remote Logging (#34)</span></li>
          <li><span class="EOP SCXW112069216 BCX2" style="font-size:
              12pt; line-height: 20.5042px; color: rgb(14, 16, 26);"
              data-ccp-props="{}">SNMP (#33)</span></li>
        </ul>
      </div>
    </div>
    <div class="SCXW112069216 BCX2">
      <div class="OutlineElement Ltr BCX2 SCXW112069216"
        style="direction: ltr;"><span data-contrast="auto"
          style="font-size: 12pt; line-height: 20.5042px;"
          class="TextRun SCXW112069216 BCX2" lang="EN-US"><span
            class="NormalTextRun SCXW112069216 BCX2"
            style="background-color: inherit;">The last 2 identified
            issues, we are looking for community help but might take
            these up ourselves one day:</span></span><span
          class="LineBreakBlob BlobObject DragDrop SCXW112069216 BCX2"
          style="font-size: 12pt; line-height: 20.5042px;"><span
            class="SCXW112069216 BCX2"></span><br>
        </span>
        <ul>
          <li><span class="LineBreakBlob BlobObject DragDrop
              SCXW112069216 BCX2" style="font-size: 12pt; line-height:
              20.5042px;">Mutual TLS (#30)</span></li>
          <li><span class="LineBreakBlob BlobObject DragDrop
              SCXW112069216 BCX2" style="font-size: 12pt; line-height:
              20.5042px;">CSRF allow list (#29)</span></li>
        </ul>
      </div>
      <div class="OutlineElement Ltr BCX2 SCXW112069216"
        style="direction: ltr;"><span style="color: rgb(14, 16, 26);
          font-size: 12pt; line-height: 20.5042px;" data-contrast="none"
          class="TextRun SCXW112069216 BCX2" lang="EN-US"><span
            class="NormalTextRun SCXW112069216 BCX2"
            style="background-color: inherit;">The last issue, Next URL
            forward (#28) has a review up.  Thanks </span></span><span
          data-contrast="auto" style="font-size: 12pt; line-height:
          20.5042px;" class="TextRun SCXW112069216 BCX2" lang="EN-US"><span
            class="NormalTextRun SCXW112069216 BCX2"
            style="background-color: inherit;">Mateusz!</span></span><span
          class="EOP SCXW112069216 BCX2" style="font-size: 12pt;
          line-height: 20.5042px;" data-ccp-props="{}"><br>
          <br>
        </span></div>
    </div>
    <div class="OutlineElement Ltr BCX2 SCXW112069216" style="direction:
      ltr;"><span style="color: rgb(14, 16, 26); font-size: 12pt;
        line-height: 20.5042px;" data-contrast="none" class="TextRun
        SCXW112069216 BCX2" lang="EN-US"><span class="NormalTextRun
          SCXW112069216 BCX2" style="background-color: inherit;">Please
          let us know if we have missed any features needed to reach
          parity with phosphor-</span></span><span style="color: rgb(14,
        16, 26); font-size: 12pt; line-height: 20.5042px;"
        data-contrast="none" class="TextRun SCXW112069216 BCX2"
        lang="EN-US"><span class="SpellingError SCXW112069216 BCX2"
          style="background-color: inherit;">webui</span></span><span
        style="color: rgb(14, 16, 26); font-size: 12pt; line-height:
        20.5042px;" data-contrast="none" class="TextRun SCXW112069216
        BCX2" lang="EN-US"><span class="NormalTextRun SCXW112069216
          BCX2" style="background-color: inherit;">.</span></span><span
        class="LineBreakBlob BlobObject DragDrop SCXW112069216 BCX2"
        style="font-size: 12pt; line-height: 20.5042px; color: rgb(14,
        16, 26);"><span class="SCXW112069216 BCX2"></span><br
          class="SCXW112069216 BCX2">
      </span><span style="color: rgb(14, 16, 26); font-size: 12pt;
        line-height: 20.5042px;" data-contrast="none" class="TextRun
        SCXW112069216 BCX2" lang="EN-US"><span class="NormalTextRun
          SCXW112069216 BCX2" style="background-color: inherit;"></span></span><span
        class="EOP SCXW112069216 BCX2" style="font-size: 12pt;
        line-height: 20.5042px; color: rgb(14, 16, 26);"
        data-ccp-props="{}"></span></div>
    <div class="OutlineElement Ltr BCX2 SCXW112069216" style="direction:
      ltr;"><span style="color: rgb(14, 16, 26); font-size: 12pt;
        line-height: 20.5042px;" data-contrast="none" class="TextRun
        SCXW112069216 BCX2" lang="EN-US"><span class="NormalTextRun
          SCXW112069216 BCX2" style="background-color: inherit;"><br>
          Would any of these outstanding issues keep the community from
          accepting </span><span class="SpellingError SCXW112069216
          BCX2" style="background-color: inherit;">webui-vue</span><span
          class="NormalTextRun SCXW112069216 BCX2"
          style="background-color: inherit;"> as the standard?</span></span><span
        class="EOP SCXW112069216 BCX2" style="font-size: 12pt;
        line-height: 20.5042px; color: rgb(14, 16, 26);"
        data-ccp-props="{}"></span></div>
    <div class="OutlineElement Ltr BCX2 SCXW112069216" style="direction:
      ltr;"><span data-contrast="auto" style="font-size: 12pt;
        line-height: 20.5042px;" class="TextRun EmptyTextRun
        SCXW112069216 BCX2" lang="EN-US"></span><span
        class="LineBreakBlob BlobObject DragDrop SCXW112069216 BCX2"
        style="font-size: 12pt; line-height: 20.5042px;"><span
          class="SCXW112069216 BCX2"></span><br class="SCXW112069216
          BCX2">
      </span><span style="color: rgb(14, 16, 26); font-size: 12pt;
        line-height: 20.5042px;" data-contrast="none" class="TextRun
        SCXW112069216 BCX2" lang="EN-US"><span class="NormalTextRun
          SCXW112069216 BCX2" style="background-color: inherit;">Not
          sure officially making </span></span><span style="color:
        rgb(14, 16, 26); font-size: 12pt; line-height: 20.5042px;"
        data-contrast="none" class="TextRun SCXW112069216 BCX2"
        lang="EN-US"><span class="SpellingError SCXW112069216 BCX2"
          style="background-color: inherit;">webui-vue</span></span><span
        style="color: rgb(14, 16, 26); font-size: 12pt; line-height:
        20.5042px;" data-contrast="none" class="TextRun SCXW112069216
        BCX2" lang="EN-US"><span class="NormalTextRun SCXW112069216
          BCX2" style="background-color: inherit;"> the standard means a
          lot, we plan to update docs/ links to point at </span></span><span
        style="color: rgb(14, 16, 26); font-size: 12pt; line-height:
        20.5042px;" data-contrast="none" class="TextRun SCXW112069216
        BCX2" lang="EN-US"><span class="SpellingError SCXW112069216
          BCX2" style="background-color: inherit;">webui-vue</span></span><span
        style="color: rgb(14, 16, 26); font-size: 12pt; line-height:
        20.5042px;" data-contrast="none" class="TextRun SCXW112069216
        BCX2" lang="EN-US"><span class="NormalTextRun SCXW112069216
          BCX2" style="background-color: inherit;"> and</span></span><span
        style="color: windowtext; font-size: 12pt; line-height:
        20.5042px;" data-contrast="auto" class="TextRun SCXW112069216
        BCX2" lang="EN-US"><span class="NormalTextRun SCXW112069216
          BCX2" style="background-color: inherit;"> view as the first
          step towards eventually deprecating / archiving phosphor-</span></span><span
        style="color: windowtext; font-size: 12pt; line-height:
        20.5042px;" data-contrast="auto" class="TextRun SCXW112069216
        BCX2" lang="EN-US"><span class="SpellingError SCXW112069216
          BCX2" style="background-color: inherit;">webui</span></span><span
        style="color: windowtext; font-size: 12pt; line-height:
        20.5042px;" data-contrast="auto" class="TextRun SCXW112069216
        BCX2" lang="EN-US"><span class="NormalTextRun SCXW112069216
          BCX2" style="background-color: inherit;">.</span></span><span
        class="EOP SCXW112069216 BCX2" style="font-size: 12pt;
        line-height: 20.5042px; color: windowtext;" data-ccp-props="{}"><br>
      </span><span class="LineBreakBlob BlobObject DragDrop
        SCXW112069216 BCX2" style="font-size: 12pt; line-height:
        20.5042px;"><span class="SCXW112069216 BCX2"></span><br
          class="SCXW112069216 BCX2">
      </span><span style="color: rgb(14, 16, 26); font-size: 12pt;
        line-height: 20.5042px;" data-contrast="none" class="TextRun
        SCXW112069216 BCX2" lang="EN-US"><span class="NormalTextRun
          SCXW112069216 BCX2" style="background-color: inherit;">Is
          there any objection to this?</span></span><span class="EOP
        SCXW112069216 BCX2" style="font-size: 12pt; line-height:
        20.5042px; color: rgb(14, 16, 26);" data-ccp-props="{}"><br>
        <br>
      </span></div>
    <div class="OutlineElement Ltr BCX2 SCXW112069216" style="direction:
      ltr;"><span data-contrast="auto" style="font-size: 12pt;
        line-height: 20.5042px;" class="TextRun SCXW112069216 BCX2"
        lang="EN-US"><span class="NormalTextRun SCXW112069216 BCX2"
          style="background-color: inherit;">Some previous discussion on
          these topics here:</span></span><span class="EOP SCXW112069216
        BCX2" style="font-size: 12pt; line-height: 20.5042px;"
        data-ccp-props="{}"></span></div>
    <div class="OutlineElement Ltr BCX2 SCXW112069216" style="direction:
      ltr;"><span data-contrast="auto" style="font-size: 12pt;
        line-height: 20.5042px;" class="TextRun EmptyTextRun
        SCXW112069216 BCX2"></span><a class="Hyperlink SCXW112069216
        BCX2" style="text-decoration: none; color: inherit;"
href="https://lists.ozlabs.org/pipermail/openbmc/2020-August/022637.html"
        target="_blank" rel="noreferrer noopener"><span style="color:
          rgb(5, 99, 193); text-decoration: underline; font-size: 12pt;
          line-height: 20.5042px;" data-contrast="none" class="TextRun
          Underlined SCXW112069216 BCX2" lang="EN-US"><span
            class="NormalTextRun SCXW112069216 BCX2"
            style="background-color: inherit;"
            data-ccp-charstyle="Hyperlink">https://lists.ozlabs.org/pipermail/openbmc/2020-August/022637.html</span></span></a><span
        data-contrast="auto" style="font-size: 12pt; line-height:
        20.5042px;" class="TextRun EmptyTextRun SCXW112069216 BCX2"></span><span
        class="EOP SCXW112069216 BCX2" style="font-size: 12pt;
        line-height: 20.5042px;" data-ccp-props="{}"></span></div>
    <div class="OutlineElement Ltr BCX2 SCXW112069216" style="direction:
      ltr;"><span data-contrast="auto" style="font-size: 12pt;
        line-height: 20.5042px;" class="TextRun EmptyTextRun
        SCXW112069216 BCX2"></span><a class="Hyperlink SCXW112069216
        BCX2" style="text-decoration: none; color: inherit;"
href="https://lists.ozlabs.org/pipermail/openbmc/2020-February/020491.html"
        target="_blank" rel="noreferrer noopener"><span style="color:
          rgb(5, 99, 193); text-decoration: underline; font-size: 12pt;
          line-height: 20.5042px;" data-contrast="none" class="TextRun
          Underlined SCXW112069216 BCX2" lang="EN-US"><span
            class="NormalTextRun SCXW112069216 BCX2"
            style="background-color: inherit;"
            data-ccp-charstyle="Hyperlink">https://lists.ozlabs.org/pipermail/openbmc/2020-February/020491.html</span></span></a><span
        data-contrast="auto" style="font-size: 12pt; line-height:
        20.5042px;" class="TextRun EmptyTextRun SCXW112069216 BCX2"></span><span
        class="EOP SCXW112069216 BCX2" style="font-size: 12pt;
        line-height: 20.5042px;" data-ccp-props="{}"></span></div>
    <div class="OutlineElement Ltr BCX2 SCXW112069216" style="direction:
      ltr;"><span data-contrast="auto" style="font-size: 12pt;
        line-height: 20.5042px;" class="TextRun SCXW112069216 BCX2"
        lang="EN-US"><span class="NormalTextRun SCXW112069216 BCX2"
          style="background-color: inherit;"></span></span><span
        class="EOP SCXW112069216 BCX2" style="font-size: 12pt;
        line-height: 20.5042px;" data-ccp-props="{}"><br>
      </span></div>
    <div class="OutlineElement Ltr BCX2 SCXW112069216" style="direction:
      ltr;"><span data-contrast="auto" style="font-size: 12pt;
        line-height: 20.5042px;" class="TextRun SCXW112069216 BCX2"
        lang="EN-US"><span class="NormalTextRun SCXW112069216 BCX2"
          style="background-color: inherit;">Thanks,</span></span><span
        class="LineBreakBlob BlobObject DragDrop SCXW112069216 BCX2"
        style="font-size: 12pt; line-height: 20.5042px;"><span
          class="SCXW112069216 BCX2"></span><br class="SCXW112069216
          BCX2">
      </span><span data-contrast="auto" style="font-size: 12pt;
        line-height: 20.5042px;" class="TextRun SCXW112069216 BCX2"
        lang="EN-US"><span class="NormalTextRun SCXW112069216 BCX2"
          style="background-color: inherit;">Derick, Gunnar, and Yoshie</span></span><span
        class="EOP SCXW112069216 BCX2" style="font-size: 12pt;
        line-height: 20.5042px;" data-ccp-props="{}"></span><span
        class="EOP SCXW112069216 BCX2" style="font-size: 12pt;
        line-height: 20.5042px; font-family: Calibri,
        Calibri_MSFontService, sans-serif;" data-ccp-props="{}"><br>
      </span></div>
  </body>
</html>

--------------9E2EB492585A4F15EE1AA0C7--

