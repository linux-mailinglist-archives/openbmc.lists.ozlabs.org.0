Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9785F517990
	for <lists+openbmc@lfdr.de>; Mon,  2 May 2022 23:58:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KscRL32jPz3bcn
	for <lists+openbmc@lfdr.de>; Tue,  3 May 2022 07:58:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RrKj3b1K;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=nirav.j2.shah@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=RrKj3b1K; dkim-atps=neutral
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KscQr2FNdz3bY5
 for <openbmc@lists.ozlabs.org>; Tue,  3 May 2022 07:57:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651528676; x=1683064676;
 h=message-id:date:mime-version:reply-to:to:from:subject;
 bh=vgrFO62SdCkxr1S0myEvvafX72nZL3bQe2DniIxaQUw=;
 b=RrKj3b1KGeAbotVu4Hp8Z+h1kjQnoWYwXa1nR4TFbqRBKMPmuZnRaU4k
 /2AkCiFBGtbnA/QLVwqEDsA8nxsckSX7f62Pxg10T4SHuTcAxU7tILTxK
 c2u6wqYBE1jG5iSgLOvcTdIamlzYbXYfqN9lArilqdnc6JrkyifXp6tOM
 L+W5sSWcO/UKvDdOWUPnHZXsB/PFveDtsQfNIb7OvpJvn3E9bLeP4zaIK
 UZQNkAdLkH02gT6AfnlC01YzADR2E2iwG+kFjUIExXrTJ4iNtZlstygZa
 g8QF3uGjC9b5W33xi2sAE5g3xX7yM6ccfBdlFzwNYOlvSudH+dMJbxtpc w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="266184434"
X-IronPort-AV: E=Sophos;i="5.91,193,1647327600"; 
 d="c'?scan'208,217";a="266184434"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 14:56:51 -0700
X-IronPort-AV: E=Sophos;i="5.91,193,1647327600"; 
 d="c'?scan'208,217";a="690720224"
Received: from njshah2-mobl.amr.corp.intel.com (HELO [10.212.168.24])
 ([10.212.168.24])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 14:56:50 -0700
Content-Type: multipart/mixed; boundary="------------lfxjid6HiUkNX8zrTQoMgPQp"
Message-ID: <16ba58d6-d06b-1c92-340b-e94119a47708@linux.intel.com>
Date: Mon, 2 May 2022 14:55:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: openbmc@lists.ozlabs.org, nirav.j2.shah@intel.com,
 nirav.j2.shah@linux.intel.com
From: Nirav Shah <nirav.j2.shah@linux.intel.com>
Organization: Intel
Subject: Running OpenBMC Daemons/Applications as non root using D-Bus
 Session/User Bus.
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
Reply-To: nirav.j2.shah@linux.intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------lfxjid6HiUkNX8zrTQoMgPQp
Content-Type: multipart/alternative;
 boundary="------------OVXbk03xKnexepDSIq6Q9vW2"

--------------OVXbk03xKnexepDSIq6Q9vW2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

I am new to OpenBMC (and BMC ), so apologies if I am posting this in the 
wrong place. I have been looking at this 
<https://github.com/openbmc/openbmc/issues/3383> issue.Here is my 
summary of the problem statement, please do comment and let me know if I 
got this right.

 1. The biggest challenge is the use of system bus and non root access
    to the system bus.
 2. As previously suggested an ACL based approach can work. (whether it
    is using a D-Bus ACL configuration file or SELinux)
 3. However, it does require an exact configuration to cover all
    security scenarios (for MAC) and IMO “may” make debugging efforts
    harder.

Coming from a desktop background (which additionally uses D-BUS 
session/user bus for user isolation), I was investigating if having a 
session bus would help. For OpenBMC, the idea would be to allow non root 
application to communicate with each other and with root** applications 
on a single session bus to begin with. This can be further augmented 
using ACL based approaches if needed. I have a small POC, which tests 
this on OpenBMC with D-Bus broker

To run the demo

  * As root, copy files dbus_session.service and dbus_session.socket to
    /etc/systemd/system/
  * useradd nirav //or change the .service and .socket file to your user
  * systemctl daemon-reload
  * systemctl start dbus_session
  * ps | grep dbus //will show an additional dbus-broker running
  * compile dbus_server.c and dbus_client.c using yocto sdk or write a
    receipe
  * ssh as root, export
    DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/bus1 and ./dbus_server
  * ssh as nirav, export
    DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/bus1 and ./dbus_client

With the POC I was able to …..

 1. Show dbus_broker_launch “–scope user” works on OpenBMC (A session
    busses can be created using the right system unit files and launcher
    provided by D-Bus broker)
     1. Since I am new to D-Bus broker and systemd I had to confirm this.
 2. Show DBUS_SESSION_BUS_ADDRESS is the only env variable required by
    root to access the session bus of another user. There is a
    limitation here, discussed below.

As far as the actual solution, idea would be to have a configuration 
file to specify which D-Bus interfaces can be on the session bus. An opt 
in model which does not need any modification to existing and future 
OpenBMC daemons/applications would be the goal but there are limitations …..

  * For root**, to access another user’s session bus, its needs to
    setuid/setgid to the corresponding user.

      o This is because D-Bus actively blocks any user even uid 0 from
        accessing another’s session bus. It would be a simple patch to
        make an exception for root. But still something that needs to be
        maintained.
  * My POC was not using sdbus/plus. At the very least, modification
    will be needed to sdbusplus, sdbus, phosphor-dbus and possibly to
    object mapper. Not sure if more applications need to change.
  * Supporting multiple session D-Buses will be really complicated for a
    lot of reasons. So even if session bus is a reasonable idea (which I
    need feedback on), I would not jump into having a session bus per
    usecase from the get-go.

I am happy to start with a design document on git hub and also make some 
code changes, but I had a few questions.

 1. Your views on, if this a workable idea?
 2. I am hoping I can isolate all the changes to sdbusplus, sdbus,
    phosphor-dbus and object mapper. What else might need to change?
 3. If I can make all these changes, I was thinking of starting with
    BMCWeb as non root but since BMCWeb interfaces with a lot of daemons
    that would be a big step. Any better ideas?



Thanks,

Nirav.

-- 
Nirav Shah
--------------OVXbk03xKnexepDSIq6Q9vW2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>
    </p>
    <p class="MsoNormal">Hello, </p>
    <p class="MsoNormal"> </p>
    <p class="MsoNormal">I am new to OpenBMC (and BMC ), so apologies if
      I am posting
      this in the wrong place. I have been looking at <a
        href="https://github.com/openbmc/openbmc/issues/3383">this</a>
      issue.<span style="mso-spacerun:yes">  </span>Here is my summary
      of the problem statement,
      please do comment and let me know if I got this right.</p>
    <ol style="margin-top:0in" type="1" start="1">
      <li class="MsoListParagraph" style="margin-left:0in;mso-list:l3
        level1 lfo1">The biggest challenge is the use of system bus and
        non root access to the system bus. </li>
      <li class="MsoListParagraph" style="margin-left:0in;mso-list:l3
        level1 lfo1">As previously suggested an ACL based approach can
        work. (whether it is using a D-Bus ACL configuration file or
        SELinux) </li>
      <li class="MsoListParagraph" style="margin-left:0in;mso-list:l3
        level1 lfo1">However, it does require an exact configuration to
        cover all security scenarios (for MAC) and IMO “may” make
        debugging efforts harder.<span style="mso-spacerun:yes">  </span></li>
    </ol>
    <p class="MsoNormal">Coming from a desktop background (which
      additionally uses
      D-BUS session/user bus for user isolation), I was investigating if
      having a
      session bus would help. For OpenBMC, the idea would be to allow
      non root
      application to communicate with each other and with root**
      applications on a
      single session bus to begin with. This can be further augmented
      using ACL based
      approaches if needed. I have a small POC, which tests this on
      OpenBMC with
      D-Bus broker</p>
    <p class="MsoNormal"
      style="mso-margin-top-alt:auto;mso-margin-bottom-alt:auto"><span
        style="mso-ascii-font-family:Calibri;mso-fareast-font-family:&quot;Times
        New Roman&quot;;
        mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri">To
        run the demo</span></p>
    <ul type="disc">
      <li class="MsoListParagraph"
        style="mso-margin-top-alt:auto;mso-margin-bottom-alt:
        auto;margin-left:0in;mso-list:l0 level1 lfo1"><span
          style="mso-ascii-font-family:
          Calibri;mso-fareast-font-family:&quot;Times New
          Roman&quot;;mso-hansi-font-family:
          Calibri;mso-bidi-font-family:Calibri">As root, copy files
          dbus_session.service and dbus_session.socket to
          /etc/systemd/system/</span></li>
      <li class="MsoListParagraph"
        style="mso-margin-top-alt:auto;mso-margin-bottom-alt:
        auto;margin-left:0in;mso-list:l0 level1 lfo1"><span
          style="mso-ascii-font-family:
          Calibri;mso-fareast-font-family:&quot;Times New
          Roman&quot;;mso-hansi-font-family:
          Calibri;mso-bidi-font-family:Calibri">useradd nirav //or
          change the .service and .socket file to your user</span></li>
      <li class="MsoListParagraph"
        style="mso-margin-top-alt:auto;mso-margin-bottom-alt:
        auto;margin-left:0in;mso-list:l0 level1 lfo1"><span
          style="mso-ascii-font-family:
          Calibri;mso-fareast-font-family:&quot;Times New
          Roman&quot;;mso-hansi-font-family:
          Calibri;mso-bidi-font-family:Calibri">systemctl daemon-reload</span></li>
      <li class="MsoListParagraph"
        style="mso-margin-top-alt:auto;mso-margin-bottom-alt:
        auto;margin-left:0in;mso-list:l0 level1 lfo1"><span
          style="mso-ascii-font-family:
          Calibri;mso-fareast-font-family:&quot;Times New
          Roman&quot;;mso-hansi-font-family:
          Calibri;mso-bidi-font-family:Calibri">systemctl start
          dbus_session</span></li>
      <li class="MsoListParagraph"
        style="mso-margin-top-alt:auto;mso-margin-bottom-alt:
        auto;margin-left:0in;mso-list:l0 level1 lfo1"><span
          style="mso-ascii-font-family:
          Calibri;mso-fareast-font-family:&quot;Times New
          Roman&quot;;mso-hansi-font-family:
          Calibri;mso-bidi-font-family:Calibri">ps | grep dbus //will
          show an additional dbus-broker running</span></li>
      <li class="MsoListParagraph"
        style="mso-margin-top-alt:auto;mso-margin-bottom-alt:
        auto;margin-left:0in;mso-list:l0 level1 lfo1"><span
          style="mso-ascii-font-family:
          Calibri;mso-fareast-font-family:&quot;Times New
          Roman&quot;;mso-hansi-font-family:
          Calibri;mso-bidi-font-family:Calibri">compile dbus_server.c
          and dbus_client.c using yocto sdk or write a receipe</span></li>
      <li class="MsoListParagraph"
        style="mso-margin-top-alt:auto;mso-margin-bottom-alt:
        auto;margin-left:0in;mso-list:l0 level1 lfo1"><span
          style="mso-ascii-font-family:
          Calibri;mso-fareast-font-family:&quot;Times New
          Roman&quot;;mso-hansi-font-family:
          Calibri;mso-bidi-font-family:Calibri">ssh as root, export
          DBUS_SESSION_BUS_ADDRESS</span>=<span
          style="mso-ascii-font-family:Calibri;mso-fareast-font-family:&quot;Times
          New Roman&quot;;
          mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri">unix:path=/run/user/bus1
          and ./dbus_server</span></li>
      <li class="MsoListParagraph"
        style="mso-margin-top-alt:auto;mso-margin-bottom-alt:
        auto;margin-left:0in;mso-list:l0 level1 lfo1"><span
          style="mso-ascii-font-family:
          Calibri;mso-fareast-font-family:&quot;Times New
          Roman&quot;;mso-hansi-font-family:
          Calibri;mso-bidi-font-family:Calibri">ssh as nirav, export
          DBUS_SESSION_BUS_ADDRESS</span>=<span
          style="mso-ascii-font-family:Calibri;mso-fareast-font-family:&quot;Times
          New Roman&quot;;
          mso-hansi-font-family:Calibri;mso-bidi-font-family:Calibri">unix:path=/run/user/bus1
          and ./dbus_client</span></li>
    </ul>
    <!--[if gte mso 9]><xml>
 <o:OfficeDocumentSettings>
  <o:AllowPNG/>
 </o:OfficeDocumentSettings>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:View>Normal</w:View>
  <w:Zoom>0</w:Zoom>
  <w:TrackMoves/>
  <w:TrackFormatting/>
  <w:PunctuationKerning/>
  <w:ValidateAgainstSchemas/>
  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>
  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>
  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>
  <w:DoNotPromoteQF/>
  <w:LidThemeOther>EN-US</w:LidThemeOther>
  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>
  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>
  <w:Compatibility>
   <w:BreakWrappedTables/>
   <w:SnapToGridInCell/>
   <w:WrapTextWithPunct/>
   <w:UseAsianBreakRules/>
   <w:DontGrowAutofit/>
   <w:SplitPgBreakAndParaMark/>
   <w:EnableOpenTypeKerning/>
   <w:DontFlipMirrorIndents/>
   <w:OverrideTableStyleHps/>
  </w:Compatibility>
  <w:BrowserLevel>MicrosoftInternetExplorer4</w:BrowserLevel>
  <m:mathPr>
   <m:mathFont m:val="Cambria Math"/>
   <m:brkBin m:val="before"/>
   <m:brkBinSub m:val="&#45;-"/>
   <m:smallFrac m:val="off"/>
   <m:dispDef/>
   <m:lMargin m:val="0"/>
   <m:rMargin m:val="0"/>
   <m:defJc m:val="centerGroup"/>
   <m:wrapIndent m:val="1440"/>
   <m:intLim m:val="subSup"/>
   <m:naryLim m:val="undOvr"/>
  </m:mathPr></w:WordDocument>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="false"
  DefSemiHidden="false" DefQFormat="false" DefPriority="99"
  LatentStyleCount="376">
  <w:LsdException Locked="false" Priority="0" QFormat="true" Name="Normal"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 1"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 2"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 3"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 4"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 5"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 6"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 7"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 8"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 9"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 1"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 2"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 3"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 4"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 5"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 6"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 7"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 8"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="header"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footer"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index heading"/>
  <w:LsdException Locked="false" Priority="35" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="caption"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of figures"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope return"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="line number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="page number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of authorities"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="macro"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="toa heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 5"/>
  <w:LsdException Locked="false" Priority="10" QFormat="true" Name="Title"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Closing"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Signature"/>
  <w:LsdException Locked="false" Priority="1" SemiHidden="true"
   UnhideWhenUsed="true" Name="Default Paragraph Font"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Message Header"/>
  <w:LsdException Locked="false" Priority="11" QFormat="true" Name="Subtitle"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Salutation"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Date"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Note Heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Block Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Hyperlink"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="FollowedHyperlink"/>
  <w:LsdException Locked="false" Priority="22" QFormat="true" Name="Strong"/>
  <w:LsdException Locked="false" Priority="20" QFormat="true" Name="Emphasis"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Document Map"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Plain Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="E-mail Signature"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Top of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Bottom of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal (Web)"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Acronym"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Cite"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Code"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Definition"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Keyboard"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Preformatted"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Sample"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Typewriter"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Variable"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Table"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation subject"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="No List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Contemporary"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Elegant"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Professional"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Balloon Text"/>
  <w:LsdException Locked="false" Priority="39" Name="Table Grid"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Theme"/>
  <w:LsdException Locked="false" SemiHidden="true" Name="Placeholder Text"/>
  <w:LsdException Locked="false" Priority="1" QFormat="true" Name="No Spacing"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 1"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 1"/>
  <w:LsdException Locked="false" SemiHidden="true" Name="Revision"/>
  <w:LsdException Locked="false" Priority="34" QFormat="true"
   Name="List Paragraph"/>
  <w:LsdException Locked="false" Priority="29" QFormat="true" Name="Quote"/>
  <w:LsdException Locked="false" Priority="30" QFormat="true"
   Name="Intense Quote"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 1"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 1"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 2"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 2"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 2"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 3"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 3"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 3"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 4"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 4"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 4"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 5"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 5"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 5"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 6"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 6"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 6"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="19" QFormat="true"
   Name="Subtle Emphasis"/>
  <w:LsdException Locked="false" Priority="21" QFormat="true"
   Name="Intense Emphasis"/>
  <w:LsdException Locked="false" Priority="31" QFormat="true"
   Name="Subtle Reference"/>
  <w:LsdException Locked="false" Priority="32" QFormat="true"
   Name="Intense Reference"/>
  <w:LsdException Locked="false" Priority="33" QFormat="true" Name="Book Title"/>
  <w:LsdException Locked="false" Priority="37" SemiHidden="true"
   UnhideWhenUsed="true" Name="Bibliography"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="TOC Heading"/>
  <w:LsdException Locked="false" Priority="41" Name="Plain Table 1"/>
  <w:LsdException Locked="false" Priority="42" Name="Plain Table 2"/>
  <w:LsdException Locked="false" Priority="43" Name="Plain Table 3"/>
  <w:LsdException Locked="false" Priority="44" Name="Plain Table 4"/>
  <w:LsdException Locked="false" Priority="45" Name="Plain Table 5"/>
  <w:LsdException Locked="false" Priority="40" Name="Grid Table Light"/>
  <w:LsdException Locked="false" Priority="46" Name="Grid Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="Grid Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="Grid Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="46" Name="List Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="List Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="List Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Mention"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Smart Hyperlink"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Hashtag"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Unresolved Mention"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Smart Link"/>
 </w:LatentStyles>
</xml><![endif]--><!--[if gte mso 10]>
<style>
 /* Style Definitions */
 table.MsoNormalTable
	{mso-style-name:"Table Normal";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-parent:"";
	mso-padding-alt:0in 5.4pt 0in 5.4pt;
	mso-para-margin:0in;
	mso-pagination:widow-orphan;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;
	mso-ascii-font-family:Calibri;
	mso-ascii-theme-font:minor-latin;
	mso-hansi-font-family:Calibri;
	mso-hansi-theme-font:minor-latin;
	mso-bidi-font-family:"Times New Roman";
	mso-bidi-theme-font:minor-bidi;}
</style>
<![endif]-->
    <p class="MsoNormal">With the POC I was able to …..</p>
    <ol style="margin-top:0in" type="1" start="1">
      <li class="MsoListParagraph" style="margin-left:0in;mso-list:l0
        level1 lfo2">Show dbus_broker_launch “–scope user” works on
        OpenBMC (A session busses can be created using the right system
        unit files and launcher provided by D-Bus broker)</li>
      <ol style="margin-top:0in" type="1" start="1">
        <li class="MsoListParagraph" style="margin-left:0in;mso-list:l0
          level2 lfo2">Since I am new to D-Bus broker and systemd I had
          to confirm this. </li>
      </ol>
      <li class="MsoListParagraph" style="margin-left:0in;mso-list:l0
        level1 lfo2">Show DBUS_SESSION_BUS_ADDRESS is the only env
        variable required by root to access the session bus of another
        user. There is a limitation here, discussed below. </li>
    </ol>
    <p class="MsoNormal">As far as the actual solution, idea would be to
      have a
      configuration file to specify which D-Bus interfaces can be on the
      session bus.
      An opt in model which does not need any modification to existing
      and future OpenBMC
      daemons/applications would be the goal but there are limitations
      …..</p>
    <ul style="margin-top:0in" type="disc">
      <li class="MsoListParagraph" style="margin-left:0in;mso-list:l1
        level1 lfo4">For root**, to access another user’s session bus,
        its needs to setuid/setgid to the corresponding user.</li>
    </ul>
    <ul style="margin-top:0in" type="disc">
      <ul style="margin-top:0in" type="circle">
        <li class="MsoListParagraph" style="margin-left:0in;mso-list:l2
          level2 lfo3">This is because D-Bus actively blocks any user
          even uid 0 from accessing another’s session bus. It would be a
          simple patch to make an exception for root. But still
          something that needs to be maintained. </li>
      </ul>
      <li class="MsoListParagraph" style="margin-left:0in;mso-list:l2
        level1 lfo3">My POC was not using sdbus/plus. At the very least,
        modification will be needed to sdbusplus, sdbus, phosphor-dbus
        and possibly to object mapper. Not sure if more applications
        need to change.</li>
      <li class="MsoListParagraph" style="margin-left:0in;mso-list:l2
        level1 lfo3">Supporting multiple session D-Buses will be really
        complicated for a lot of reasons. So even if session bus is a
        reasonable idea (which I need feedback on), I would not jump
        into having a session bus per usecase from the get-go. </li>
    </ul>
    <p class="MsoNormal">I am happy to start with a design document on
      git hub and also
      make some code changes, but I had a few questions.</p>
    <ol style="margin-top:0in" type="1" start="1">
      <li class="MsoListParagraph" style="margin-left:0in;mso-list:l4
        level1 lfo5">Your views on, if this a workable idea?</li>
      <li class="MsoListParagraph" style="margin-left:0in;mso-list:l4
        level1 lfo5">I am hoping I can isolate all the changes to
        sdbusplus, sdbus, phosphor-dbus and object mapper. What else
        might need to change?</li>
      <li class="MsoListParagraph" style="margin-left:0in;mso-list:l4
        level1 lfo5">If I can make all these changes, I was thinking of
        starting with BMCWeb as non root but since BMCWeb interfaces
        with a lot of daemons that would be a big step. Any better
        ideas?</li>
    </ol>
    <p><br>
    </p>
    <p><br>
    </p>
    <p class="MsoNormal">Thanks,</p>
    <p class="MsoNormal">Nirav.</p>
    <p class="MsoNormal"> </p>
    <p class="MsoNormal"> </p>
    <p class="MsoNormal"> </p>
    <p><!--[if gte mso 9]><xml>
 <o:OfficeDocumentSettings>
  <o:AllowPNG/>
 </o:OfficeDocumentSettings>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:View>Normal</w:View>
  <w:Zoom>0</w:Zoom>
  <w:TrackMoves/>
  <w:TrackFormatting/>
  <w:PunctuationKerning/>
  <w:ValidateAgainstSchemas/>
  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>
  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>
  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>
  <w:DoNotPromoteQF/>
  <w:LidThemeOther>EN-US</w:LidThemeOther>
  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>
  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>
  <w:Compatibility>
   <w:BreakWrappedTables/>
   <w:SnapToGridInCell/>
   <w:WrapTextWithPunct/>
   <w:UseAsianBreakRules/>
   <w:DontGrowAutofit/>
   <w:SplitPgBreakAndParaMark/>
   <w:EnableOpenTypeKerning/>
   <w:DontFlipMirrorIndents/>
   <w:OverrideTableStyleHps/>
  </w:Compatibility>
  <w:BrowserLevel>MicrosoftInternetExplorer4</w:BrowserLevel>
  <m:mathPr>
   <m:mathFont m:val="Cambria Math"/>
   <m:brkBin m:val="before"/>
   <m:brkBinSub m:val="&#45;-"/>
   <m:smallFrac m:val="off"/>
   <m:dispDef/>
   <m:lMargin m:val="0"/>
   <m:rMargin m:val="0"/>
   <m:defJc m:val="centerGroup"/>
   <m:wrapIndent m:val="1440"/>
   <m:intLim m:val="subSup"/>
   <m:naryLim m:val="undOvr"/>
  </m:mathPr></w:WordDocument>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="false"
  DefSemiHidden="false" DefQFormat="false" DefPriority="99"
  LatentStyleCount="376">
  <w:LsdException Locked="false" Priority="0" QFormat="true" Name="Normal"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 1"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 2"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 3"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 4"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 5"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 6"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 7"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 8"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 9"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 1"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 2"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 3"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 4"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 5"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 6"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 7"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 8"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="header"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footer"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index heading"/>
  <w:LsdException Locked="false" Priority="35" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="caption"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of figures"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope return"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="line number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="page number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of authorities"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="macro"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="toa heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 5"/>
  <w:LsdException Locked="false" Priority="10" QFormat="true" Name="Title"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Closing"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Signature"/>
  <w:LsdException Locked="false" Priority="1" SemiHidden="true"
   UnhideWhenUsed="true" Name="Default Paragraph Font"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Message Header"/>
  <w:LsdException Locked="false" Priority="11" QFormat="true" Name="Subtitle"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Salutation"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Date"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Note Heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Block Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Hyperlink"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="FollowedHyperlink"/>
  <w:LsdException Locked="false" Priority="22" QFormat="true" Name="Strong"/>
  <w:LsdException Locked="false" Priority="20" QFormat="true" Name="Emphasis"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Document Map"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Plain Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="E-mail Signature"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Top of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Bottom of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal (Web)"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Acronym"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Cite"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Code"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Definition"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Keyboard"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Preformatted"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Sample"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Typewriter"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Variable"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Table"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation subject"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="No List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Contemporary"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Elegant"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Professional"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Balloon Text"/>
  <w:LsdException Locked="false" Priority="39" Name="Table Grid"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Theme"/>
  <w:LsdException Locked="false" SemiHidden="true" Name="Placeholder Text"/>
  <w:LsdException Locked="false" Priority="1" QFormat="true" Name="No Spacing"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 1"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 1"/>
  <w:LsdException Locked="false" SemiHidden="true" Name="Revision"/>
  <w:LsdException Locked="false" Priority="34" QFormat="true"
   Name="List Paragraph"/>
  <w:LsdException Locked="false" Priority="29" QFormat="true" Name="Quote"/>
  <w:LsdException Locked="false" Priority="30" QFormat="true"
   Name="Intense Quote"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 1"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 1"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 2"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 2"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 2"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 3"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 3"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 3"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 4"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 4"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 4"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 5"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 5"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 5"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 6"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 6"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 6"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="19" QFormat="true"
   Name="Subtle Emphasis"/>
  <w:LsdException Locked="false" Priority="21" QFormat="true"
   Name="Intense Emphasis"/>
  <w:LsdException Locked="false" Priority="31" QFormat="true"
   Name="Subtle Reference"/>
  <w:LsdException Locked="false" Priority="32" QFormat="true"
   Name="Intense Reference"/>
  <w:LsdException Locked="false" Priority="33" QFormat="true" Name="Book Title"/>
  <w:LsdException Locked="false" Priority="37" SemiHidden="true"
   UnhideWhenUsed="true" Name="Bibliography"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="TOC Heading"/>
  <w:LsdException Locked="false" Priority="41" Name="Plain Table 1"/>
  <w:LsdException Locked="false" Priority="42" Name="Plain Table 2"/>
  <w:LsdException Locked="false" Priority="43" Name="Plain Table 3"/>
  <w:LsdException Locked="false" Priority="44" Name="Plain Table 4"/>
  <w:LsdException Locked="false" Priority="45" Name="Plain Table 5"/>
  <w:LsdException Locked="false" Priority="40" Name="Grid Table Light"/>
  <w:LsdException Locked="false" Priority="46" Name="Grid Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="Grid Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="Grid Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="46" Name="List Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="List Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="List Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Mention"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Smart Hyperlink"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Hashtag"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Unresolved Mention"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Smart Link"/>
 </w:LatentStyles>
</xml><![endif]--><!--[if gte mso 10]>
<style>
 /* Style Definitions */
 table.MsoNormalTable
	{mso-style-name:"Table Normal";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-parent:"";
	mso-padding-alt:0in 5.4pt 0in 5.4pt;
	mso-para-margin:0in;
	mso-pagination:widow-orphan;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;
	mso-ascii-font-family:Calibri;
	mso-ascii-theme-font:minor-latin;
	mso-hansi-font-family:Calibri;
	mso-hansi-theme-font:minor-latin;
	mso-bidi-font-family:"Times New Roman";
	mso-bidi-theme-font:minor-bidi;}
</style>
<![endif]--></p>
    <div class="moz-signature">-- <br>
      Nirav Shah</div>
  </body>
</html>

--------------OVXbk03xKnexepDSIq6Q9vW2--

--------------lfxjid6HiUkNX8zrTQoMgPQp
Content-Type: text/plain; charset=UTF-8; name="dbus_client.c"
Content-Disposition: attachment; filename="dbus_client.c"
Content-Transfer-Encoding: base64

LyoKICoKICogICAgIGFkZC1jbGllbnQuYzogY2xpZW50IHByb2dyYW0sIHRha2VzIHR3byBu
dW1iZXJzIGFzIGlucHV0LAogKiAgICAgICAgICAgICAgICAgICBzZW5kcyB0byBzZXJ2ZXIg
Zm9yIGFkZGl0aW9uLAogKiAgICAgICAgICAgICAgICAgICBnZXRzIHJlc3VsdCBmcm9tIHNl
cnZlciwKICogICAgICAgICAgICAgICAgICAgcHJpbnRzIHRoZSByZXN1bHQgb24gdGhlIHNj
cmVlbgogKgogKi8KCiNpbmNsdWRlIDxzdGRpby5oPgojaW5jbHVkZSA8c3RkbGliLmg+CiNp
bmNsdWRlIDx1bmlzdGQuaD4KI2luY2x1ZGUgPHN0cmluZy5oPgojaW5jbHVkZSA8c3RkYm9v
bC5oPgojaW5jbHVkZSA8Y3R5cGUuaD4KCiNpbmNsdWRlIDxkYnVzL2RidXMuaD4KCgpjb25z
dCBjaGFyICpjb25zdCBJTlRFUkZBQ0VfTkFNRSA9ICJvcmcubmlyYXYuZGJ1c19leGFtcGxl
IjsKY29uc3QgY2hhciAqY29uc3QgU0VSVkVSX0JVU19OQU1FID0gIm9yZy5uaXJhdi5hZGRf
c2VydmVyIjsKY29uc3QgY2hhciAqY29uc3QgQ0xJRU5UX0JVU19OQU1FID0gIm9yZy5uaXJh
di5hZGRfY2xpZW50IjsKY29uc3QgY2hhciAqY29uc3QgU0VSVkVSX09CSkVDVF9QQVRIX05B
TUUgPSAiL29yZy9uaXJhdi9hZGRlciI7CmNvbnN0IGNoYXIgKmNvbnN0IENMSUVOVF9PQkpF
Q1RfUEFUSF9OQU1FID0gIi9vcmcvbmlyYXYvYWRkX2NsaWVudCI7CmNvbnN0IGNoYXIgKmNv
bnN0IE1FVEhPRF9OQU1FID0gImFkZF9udW1iZXJzIjsKCkRCdXNFcnJvciBkYnVzX2Vycm9y
Owp2b2lkIHByaW50X2RidXNfZXJyb3IgKGNoYXIgKnN0cik7CgppbnQgbWFpbiAoaW50IGFy
Z2MsIGNoYXIgKiphcmd2KQp7CiAgICBEQnVzQ29ubmVjdGlvbiAqY29ubjsKICAgIGludCBy
ZXQ7CiAgICBjaGFyIGlucHV0IFs4MF07CgogICAgZGJ1c19lcnJvcl9pbml0ICgmZGJ1c19l
cnJvcik7CgogICAgY29ubiA9IGRidXNfYnVzX2dldCAoREJVU19CVVNfU0VTU0lPTiwgJmRi
dXNfZXJyb3IpOwoKICAgIGlmIChkYnVzX2Vycm9yX2lzX3NldCAoJmRidXNfZXJyb3IpKQog
ICAgICAgIHByaW50X2RidXNfZXJyb3IgKCJkYnVzX2J1c19nZXQiKTsKCiAgICBpZiAoIWNv
bm4pCiAgICAgICAgZXhpdCAoMSk7CgogICAgcHJpbnRmICgiUGxlYXNlIHR5cGUgdHdvIG51
bWJlcnM6ICIpOwogICAgd2hpbGUgKGZnZXRzIChpbnB1dCwgNzgsIHN0ZGluKSAhPSBOVUxM
KSB7CgogICAgICAgIC8vIEdldCBhIHdlbGwga25vd24gbmFtZQogICAgICAgIHdoaWxlICgx
KSB7CiAgICAgICAgICAgIHJldCA9IGRidXNfYnVzX3JlcXVlc3RfbmFtZSAoY29ubiwgQ0xJ
RU5UX0JVU19OQU1FLCAwLCAmZGJ1c19lcnJvcik7CgogICAgICAgICAgICBpZiAocmV0ID09
IERCVVNfUkVRVUVTVF9OQU1FX1JFUExZX1BSSU1BUllfT1dORVIpCiAgICAgICAgICAgICAg
IGJyZWFrOwoKICAgICAgICAgICAgaWYgKHJldCA9PSBEQlVTX1JFUVVFU1RfTkFNRV9SRVBM
WV9JTl9RVUVVRSkgewogICAgICAgICAgICAgICBmcHJpbnRmIChzdGRlcnIsICJXYWl0aW5n
IGZvciB0aGUgYnVzIC4uLiBcbiIpOwogICAgICAgICAgICAgICBzbGVlcCAoMSk7CiAgICAg
ICAgICAgICAgIGNvbnRpbnVlOwogICAgICAgICAgICB9CiAgICAgICAgICAgIGlmIChkYnVz
X2Vycm9yX2lzX3NldCAoJmRidXNfZXJyb3IpKQogICAgICAgICAgICAgICBwcmludF9kYnVz
X2Vycm9yICgiZGJ1c19idXNfZ2V0Iik7CiAgICAgICAgfQoKICAgICAgICBEQnVzTWVzc2Fn
ZSAqcmVxdWVzdDsKCiAgICAgICAgaWYgKChyZXF1ZXN0ID0gZGJ1c19tZXNzYWdlX25ld19t
ZXRob2RfY2FsbCAoU0VSVkVSX0JVU19OQU1FLCBTRVJWRVJfT0JKRUNUX1BBVEhfTkFNRSwK
ICAgICAgICAgICAgICAgICAgICAgICAgICAgSU5URVJGQUNFX05BTUUsIE1FVEhPRF9OQU1F
KSkgPT0gTlVMTCkgewogICAgICAgICAgICBmcHJpbnRmIChzdGRlcnIsICJFcnJvciBpbiBk
YnVzX21lc3NhZ2VfbmV3X21ldGhvZF9jYWxsXG4iKTsKICAgICAgICAgICAgZXhpdCAoMSk7
CiAgICAgICAgfQoKICAgICAgICBEQnVzTWVzc2FnZUl0ZXIgaXRlcjsKICAgICAgICBkYnVz
X21lc3NhZ2VfaXRlcl9pbml0X2FwcGVuZCAocmVxdWVzdCwgJml0ZXIpOwogICAgICAgIGNo
YXIgKnB0ciA9IGlucHV0OwogICAgICAgIGlmICghZGJ1c19tZXNzYWdlX2l0ZXJfYXBwZW5k
X2Jhc2ljICgmaXRlciwgREJVU19UWVBFX1NUUklORywgJnB0cikpIHsKICAgICAgICAgICAg
ZnByaW50ZiAoc3RkZXJyLCAiRXJyb3IgaW4gZGJ1c19tZXNzYWdlX2l0ZXJfYXBwZW5kX2Jh
c2ljXG4iKTsKICAgICAgICAgICAgZXhpdCAoMSk7CiAgICAgICAgfQogICAgICAgIERCdXNQ
ZW5kaW5nQ2FsbCAqcGVuZGluZ19yZXR1cm47CiAgICAgICAgaWYgKCFkYnVzX2Nvbm5lY3Rp
b25fc2VuZF93aXRoX3JlcGx5IChjb25uLCByZXF1ZXN0LCAmcGVuZGluZ19yZXR1cm4sIC0x
KSkgewogICAgICAgICAgICBmcHJpbnRmIChzdGRlcnIsICJFcnJvciBpbiBkYnVzX2Nvbm5l
Y3Rpb25fc2VuZF93aXRoX3JlcGx5XG4iKTsKICAgICAgICAgICAgZXhpdCAoMSk7CiAgICAg
ICAgfQoKICAgICAgICBpZiAocGVuZGluZ19yZXR1cm4gPT0gTlVMTCkgewogICAgICAgICAg
ICBmcHJpbnRmIChzdGRlcnIsICJwZW5kaW5nIHJldHVybiBpcyBOVUxMIik7CiAgICAgICAg
ICAgIGV4aXQgKDEpOwogICAgICAgIH0KCiAgICAgICAgZGJ1c19jb25uZWN0aW9uX2ZsdXNo
IChjb25uKTsKCiAgICAgICAgZGJ1c19tZXNzYWdlX3VucmVmIChyZXF1ZXN0KTsKCiAgICAg
ICAgZGJ1c19wZW5kaW5nX2NhbGxfYmxvY2sgKHBlbmRpbmdfcmV0dXJuKTsKCiAgICAgICAg
REJ1c01lc3NhZ2UgKnJlcGx5OwogICAgICAgIGlmICgocmVwbHkgPSBkYnVzX3BlbmRpbmdf
Y2FsbF9zdGVhbF9yZXBseSAocGVuZGluZ19yZXR1cm4pKSA9PSBOVUxMKSB7CiAgICAgICAg
ICAgIGZwcmludGYgKHN0ZGVyciwgIkVycm9yIGluIGRidXNfcGVuZGluZ19jYWxsX3N0ZWFs
X3JlcGx5Iik7CiAgICAgICAgICAgIGV4aXQgKDEpOwogICAgICAgIH0KCiAgICAgICAgZGJ1
c19wZW5kaW5nX2NhbGxfdW5yZWYJKHBlbmRpbmdfcmV0dXJuKTsKCiAgICAgICAgY2hhciAq
czsKICAgICAgICBpZiAoZGJ1c19tZXNzYWdlX2dldF9hcmdzIChyZXBseSwgJmRidXNfZXJy
b3IsIERCVVNfVFlQRV9TVFJJTkcsICZzLCBEQlVTX1RZUEVfSU5WQUxJRCkpIHsKICAgICAg
ICAgICAgcHJpbnRmICgiJXNcbiIsIHMpOwogICAgICAgIH0KICAgICAgICBlbHNlCiAgICAg
ICAgewogICAgICAgICAgICAgZnByaW50ZiAoc3RkZXJyLCAiRGlkIG5vdCBnZXQgYXJndW1l
bnRzIGluIHJlcGx5XG4iKTsKICAgICAgICAgICAgIGV4aXQgKDEpOwogICAgICAgIH0KICAg
ICAgICBkYnVzX21lc3NhZ2VfdW5yZWYgKHJlcGx5KTsKCiAgICAgICAgaWYgKGRidXNfYnVz
X3JlbGVhc2VfbmFtZSAoY29ubiwgQ0xJRU5UX0JVU19OQU1FLCAmZGJ1c19lcnJvcikgPT0g
LTEpIHsKICAgICAgICAgICAgIGZwcmludGYgKHN0ZGVyciwgIkVycm9yIGluIGRidXNfYnVz
X3JlbGVhc2VfbmFtZVxuIik7CiAgICAgICAgICAgICBleGl0ICgxKTsKICAgICAgICB9Cgog
ICAgICAgIHByaW50ZiAoIlBsZWFzZSB0eXBlIHR3byBudW1iZXJzOiAiKTsKICAgIH0KCiAg
ICByZXR1cm4gMDsKfQoKdm9pZCBwcmludF9kYnVzX2Vycm9yIChjaGFyICpzdHIpCnsKICAg
IGZwcmludGYgKHN0ZGVyciwgIiVzOiAlc1xuIiwgc3RyLCBkYnVzX2Vycm9yLm1lc3NhZ2Up
OwogICAgZGJ1c19lcnJvcl9mcmVlICgmZGJ1c19lcnJvcik7Cn0K
--------------lfxjid6HiUkNX8zrTQoMgPQp
Content-Type: text/plain; charset=UTF-8; name="dbus_session.service"
Content-Disposition: attachment; filename="dbus_session.service"
Content-Transfer-Encoding: base64

W1VuaXRdCkRlc2NyaXB0aW9uPUQtQnVzIFVzZXIgTWVzc2FnZSBCdXMKRG9jdW1lbnRhdGlv
bj1tYW46ZGJ1cy1kYWVtb24oMSkKUmVxdWlyZXM9ZGJ1c19zZXNzaW9uLnNvY2tldAoKW1Nl
cnZpY2VdClR5cGU9bm90aWZ5ClVzZXI9bmlyYXYKR3JvdXA9bmlyYXYKTm90aWZ5QWNjZXNz
PW1haW4KRXhlY1N0YXJ0PS91c3IvYmluL2RidXMtYnJva2VyLWxhdW5jaCAtLXNjb3BlIHVz
ZXIgLS1hdWRpdApFeGVjUmVsb2FkPS91c3IvYmluL2RidXMtc2VuZCAtLXByaW50LXJlcGx5
IC0tc2Vzc2lvbiAtLXR5cGU9bWV0aG9kX2NhbGwgLS1kZXN0PW9yZy5mcmVlZGVza3RvcC5E
QnVzIC8gb3JnLmZyZWVkZXNrdG9wLkRCdXMuUmVsb2FkQ29uZmlnClNsaWNlPXNlc3Npb24u
c2xpY2UK
--------------lfxjid6HiUkNX8zrTQoMgPQp
Content-Type: text/plain; charset=UTF-8; name="dbus_session.socket"
Content-Disposition: attachment; filename="dbus_session.socket"
Content-Transfer-Encoding: base64

W1VuaXRdCkRlc2NyaXB0aW9uPUQtQnVzIFVzZXIgTWVzc2FnZSBCdXMgU29ja2V0CgpbU29j
a2V0XQpMaXN0ZW5TdHJlYW09JXQvdXNlci9idXMxClVzZXI9bmlyYXYKR3JvdXA9bmlyYXYK
RXhlY1N0YXJ0UG9zdD0tL2Jpbi9zeXN0ZW1jdGwgc2V0LWVudmlyb25tZW50IERCVVNfU0VT
U0lPTl9CVVNfQUREUkVTUz11bml4OnBhdGg9JXQvdXNlci9idXMxCg==
--------------lfxjid6HiUkNX8zrTQoMgPQp
Content-Type: text/plain; charset=UTF-8; name="dbus_server.c"
Content-Disposition: attachment; filename="dbus_server.c"
Content-Transfer-Encoding: base64

I2RlZmluZSBfR05VX1NPVVJDRSAvKiBTZWUgZmVhdHVyZV90ZXN0X21hY3Jvcyg3KSAqLwoj
aW5jbHVkZSA8c3RkaW8uaD4KI2luY2x1ZGUgPHN0ZGxpYi5oPgojaW5jbHVkZSA8c3RyaW5n
Lmg+CiNpbmNsdWRlIDxzdGRib29sLmg+CiNpbmNsdWRlIDx1bmlzdGQuaD4KI2luY2x1ZGUg
PGN0eXBlLmg+CiNpbmNsdWRlIDxkYnVzL2RidXMuaD4KI2luY2x1ZGUgPGVycm5vLmg+Cgpj
b25zdCBjaGFyICpjb25zdCBJTlRFUkZBQ0VfTkFNRSA9ICJvcmcubmlyYXYuZGJ1c19leGFt
cGxlIjsKY29uc3QgY2hhciAqY29uc3QgU0VSVkVSX0JVU19OQU1FID0gIm9yZy5uaXJhdi5h
ZGRfc2VydmVyIjsKY29uc3QgY2hhciAqY29uc3QgT0JKRUNUX1BBVEhfTkFNRSA9ICIvb3Jn
L25pcmF2L2FkZGVyIjsKY29uc3QgY2hhciAqY29uc3QgTUVUSE9EX05BTUUgPSAiYWRkX251
bWJlcnMiOwoKLyogUmVtZW1iZXIgdGhlIGVmZmVjdGl2ZSBhbmQgcmVhbCBVSURzLiAqLwpz
dGF0aWMgdWlkX3QgcnVpZCA9IDEwMDc7CmNvbnN0IGNoYXIgKnZlcnNpb24gPSAiMC4xIjsK
Ci8qIFJlc3RvcmUgdGhlIGVmZmVjdGl2ZSBVSUQgdG8gaXRzIG9yaWdpbmFsIHZhbHVlLiAq
LwoKdm9pZApkb19zZXR1aWQgKHZvaWQpCnsKICBpbnQgc3RhdHVzOwojaWZkZWYgX1BPU0lY
X1NBVkVEX0lEUwoKI2lmIDAKc3RhdHVzID0gc2V0cmVzdWlkIChydWlkLCBldWlkLCAxMDYy
KTsKCiBpZiAoc3RhdHVzIDwgMCkgewogICAgaWYgKGVycm5vID09IEVQRVJNKQogICAgICAg
cHJpbnRmKCJQZXJtaXNzaW9uIGRlbmllZCB0byBzdWRvXG4iKTsKICAgIGVsc2UKICAgICAg
IHByaW50ZiAoIkNvdWxkbid0IHNldCB1aWQuaSVkXG4iLCBlcnJubyk7Cn0Kc3RhdHVzID0g
c2V0cmVzZ2lkICgxMDYyLCAxMDYyLCAxMDYyKTsKI2Vsc2UKICAgc3RhdHVzID0gc2V0dWlk
KHJ1aWQpOwovLyAgIHN0YXR1cyA9IHNldHJlc2dpZCgxMDA3LCAxMDA3LCAxMDA3KTsKI2Vu
ZGlmCgojZWxzZQogIHN0YXR1cyA9IHNldHJldWlkIChldWlkLCBydWlkKTsKI2VuZGlmCiAg
aWYgKHN0YXR1cyA8IDApIHsKICAgIGlmIChlcnJubyA9PSBFUEVSTSkKICAgICAgIHByaW50
ZigiUGVybWlzc2lvbiBkZW5pZWQgdG8gc3Vkb1xuIik7CiAgICBlbHNlCiAgICAgICBwcmlu
dGYgKCJDb3VsZG4ndCBzZXQgdWlkLmklZFxuIiwgZXJybm8pOwogICAgZXhpdCAoc3RhdHVz
KTsKICB9Cn0KCgoKCkRCdXNFcnJvciBkYnVzX2Vycm9yOwp2b2lkIHByaW50X2RidXNfZXJy
b3IgKGNoYXIgKnN0cik7CmJvb2wgaXNpbnRlZ2VyIChjaGFyICpwdHIpOwoKaW50IG1haW4g
KGludCBhcmdjLCBjaGFyICoqYXJndikKewogICAgREJ1c0Nvbm5lY3Rpb24gKmNvbm47CiAg
ICBpbnQgcmV0OwoKICAgICAgICB1aWRfdCBscnVpZCA9IDAsIGxldWlkPTAsIGxzdWlkPTA7
CiAgICAgICAgdWlkX3QgbHJnaWQgPSAwLCBsZWdpZD0wLCBsc2dpZD0wOwogICAgICAgIGlm
ICgwID09IGdldHJlc3VpZCgmbHJ1aWQsICZsZXVpZCwgJmxzdWlkKSkKICAgICAgICAgICAg
IHByaW50ZigicnVpZD0lZCwgZXVpZD0lZCwgc3VpZD0lZFxuIiwgbHJ1aWQsIGxldWlkLCBs
c3VpZCk7CiAgICAgICAgaWYgKDAgPT0gZ2V0cmVzZ2lkKCZscmdpZCwgJmxlZ2lkLCAmbHNn
aWQpKQogICAgICAgICAgICAgcHJpbnRmKCJyZ2lkPSVkLCBlZ2lkPSVkLCBzZ2lkPSVkXG4i
LCBscmdpZCwgbGVnaWQsIGxzZ2lkKTsKI2lmIDAKICAgICAgIHByaW50ZigidHJ5IHRvIHNl
dHVpZFxuIik7CiAgICAgICAvKiBSZW1lbWJlciB0aGUgcmVhbCBhbmQgZWZmZWN0aXZlIHVz
ZXIgSURzLiAgKi8KICAgICAgICBkb19zZXR1aWQoKTsKCiAgICAgICAgaWYgKDAgPT0gZ2V0
cmVzdWlkKCZscnVpZCwgJmxldWlkLCAmbHN1aWQpKQogICAgICAgICAgICAgcHJpbnRmKCJO
ZXcgcnVpZD0lZCwgZXVpZD0lZCwgc3VpZD0lZFxuIiwgbHJ1aWQsIGxldWlkLCBsc3VpZCk7
CiAgICAgICAgaWYgKDAgPT0gZ2V0cmVzZ2lkKCZscmdpZCwgJmxlZ2lkLCAmbHNnaWQpKQog
ICAgICAgICAgICAgcHJpbnRmKCJOZXcgcmdpZD0lZCwgZWdpZD0lZCwgc2dpZD0lZFxuIiwg
bHJnaWQsIGxlZ2lkLCBsc2dpZCk7CgogICAgICAgIGxydWlkID0gZ2V0dWlkICgpOwogICAg
ICAgIGxldWlkID0gZ2V0ZXVpZCAoKTsKICAgICAgICBmcHJpbnRmKHN0ZGVyciwgIm5ldyBy
dWlkPSVkLCBuZXdfZXVpZD0lZFxuIiwgbHJ1aWQsIGxldWlkKTsKI2VuZGlmCiAgICAgICAg
cHJpbnRmKCJzdGFydGluZzFcbiIpOwoKCgogICAgZGJ1c19lcnJvcl9pbml0ICgmZGJ1c19l
cnJvcik7CgogICAgY29ubiA9IGRidXNfYnVzX2dldCAoREJVU19CVVNfU0VTU0lPTiwgJmRi
dXNfZXJyb3IpOwoKICAgIGlmIChkYnVzX2Vycm9yX2lzX3NldCAoJmRidXNfZXJyb3IpKQog
ICAgICAgIHByaW50X2RidXNfZXJyb3IgKCJkYnVzX2J1c19nZXQiKTsKCiAgICBpZiAoIWNv
bm4pCiAgICAgICAgZXhpdCAoMSk7CgogICAgLy8gR2V0IGEgd2VsbCBrbm93biBuYW1lCiAg
ICByZXQgPSBkYnVzX2J1c19yZXF1ZXN0X25hbWUgKGNvbm4sIFNFUlZFUl9CVVNfTkFNRSwg
REJVU19OQU1FX0ZMQUdfRE9fTk9UX1FVRVVFLCAmZGJ1c19lcnJvcik7CgogICAgaWYgKGRi
dXNfZXJyb3JfaXNfc2V0ICgmZGJ1c19lcnJvcikpCiAgICAgICAgcHJpbnRfZGJ1c19lcnJv
ciAoImRidXNfYnVzX2dldCIpOwoKICAgIGlmIChyZXQgIT0gREJVU19SRVFVRVNUX05BTUVf
UkVQTFlfUFJJTUFSWV9PV05FUikgewogICAgICAgIGZwcmludGYgKHN0ZGVyciwgIkRidXM6
IG5vdCBwcmltYXJ5IG93bmVyLCByZXQgPSAlZFxuIiwgcmV0KTsKICAgICAgICBleGl0ICgx
KTsKICAgIH0KCiAgICAvLyBIYW5kbGUgcmVxdWVzdCBmcm9tIGNsaWVudHMKICAgIHdoaWxl
ICgxKSB7CiAgICAgICAgLy8gQmxvY2sgZm9yIG1zZyBmcm9tIGNsaWVudAogICAgICAgIGlm
ICghZGJ1c19jb25uZWN0aW9uX3JlYWRfd3JpdGVfZGlzcGF0Y2ggKGNvbm4sIC0xKSkgewog
ICAgICAgICAgICBmcHJpbnRmIChzdGRlcnIsICJOb3QgY29ubmVjdGVkIG5vdy5cbiIpOwog
ICAgICAgICAgICBleGl0ICgxKTsKICAgICAgICB9CgogICAgICAgIERCdXNNZXNzYWdlICpt
ZXNzYWdlOwoKICAgICAgICBpZiAoKG1lc3NhZ2UgPSBkYnVzX2Nvbm5lY3Rpb25fcG9wX21l
c3NhZ2UgKGNvbm4pKSA9PSBOVUxMKSB7CiAgICAgICAgICAgIGZwcmludGYgKHN0ZGVyciwg
IkRpZCBub3QgZ2V0IG1lc3NhZ2VcbiIpOwogICAgICAgICAgICBjb250aW51ZTsKICAgICAg
ICB9CgogICAgICAgIGlmIChkYnVzX21lc3NhZ2VfaXNfbWV0aG9kX2NhbGwgKG1lc3NhZ2Us
IElOVEVSRkFDRV9OQU1FLCBNRVRIT0RfTkFNRSkpIHsKICAgICAgICAgICAgY2hhciAqczsK
ICAgICAgICAgICAgY2hhciAqc3RyMSA9IE5VTEwsICpzdHIyID0gTlVMTDsKICAgICAgICAg
ICAgY29uc3QgY2hhciBzcGFjZSBbNF0gPSAiIFxuXHQiOwogICAgICAgICAgICBsb25nIGks
IGo7CiAgICAgICAgICAgIGJvb2wgZXJyb3IgPSBmYWxzZTsKCiAgICAgICAgICAgIGlmIChk
YnVzX21lc3NhZ2VfZ2V0X2FyZ3MgKG1lc3NhZ2UsICZkYnVzX2Vycm9yLCBEQlVTX1RZUEVf
U1RSSU5HLCAmcywgREJVU19UWVBFX0lOVkFMSUQpKSB7CiAgICAgICAgICAgICAgICBwcmlu
dGYgKCIlcyIsIHMpOwogICAgICAgICAgICAgICAgLy8gVmFsaWRhdGUgcmVjZWl2ZWQgbWVz
c2FnZQogICAgICAgICAgICAgICAgc3RyMSA9IHN0cnRvayAocywgc3BhY2UpOwogICAgICAg
ICAgICAgICAgaWYgKHN0cjEpCiAgICAgICAgICAgICAgICAgICAgc3RyMiA9IHN0cnRvayAo
TlVMTCwgc3BhY2UpOwoKICAgICAgICAgICAgICAgIGlmICghc3RyMSB8fCAhc3RyMikKICAg
ICAgICAgICAgICAgICAgICBlcnJvciA9IHRydWU7CgogICAgICAgICAgICAgICAgaWYgKCFl
cnJvcikgewogICAgICAgICAgICAgICAgICAgIGlmIChpc2ludGVnZXIgKHN0cjEpKQogICAg
ICAgICAgICAgICAgICAgICAgICBpID0gYXRvbCAoc3RyMSk7CiAgICAgICAgICAgICAgICAg
ICAgZWxzZQogICAgICAgICAgICAgICAgICAgICAgICBlcnJvciA9IHRydWU7CiAgICAgICAg
ICAgICAgICB9CiAgICAgICAgICAgICAgICBpZiAoIWVycm9yKSB7CiAgICAgICAgICAgICAg
ICAgICAgaWYgKGlzaW50ZWdlciAoc3RyMikpCiAgICAgICAgICAgICAgICAgICAgICAgIGog
PSBhdG9sIChzdHIyKTsKICAgICAgICAgICAgICAgICAgICBlbHNlCiAgICAgICAgICAgICAg
ICAgICAgICAgIGVycm9yID0gdHJ1ZTsKICAgICAgICAgICAgICAgIH0KCiAgICAgICAgICAg
ICAgICBpZiAoIWVycm9yKSB7CiAgICAgICAgICAgICAgICAgICAgLy8gc2VuZCByZXBseQog
ICAgICAgICAgICAgICAgICAgIERCdXNNZXNzYWdlICpyZXBseTsKICAgICAgICAgICAgICAg
ICAgICBjaGFyIGFuc3dlciBbNDBdOwoKICAgICAgICAgICAgICAgICAgICBzcHJpbnRmIChh
bnN3ZXIsICJTdW0gaXMgJWxkIiwgaSArIGopOwogICAgICAgICAgICAgICAgICAgIGlmICgo
cmVwbHkgPSBkYnVzX21lc3NhZ2VfbmV3X21ldGhvZF9yZXR1cm4gKG1lc3NhZ2UpKSA9PSBO
VUxMKSB7CiAgICAgICAgICAgICAgICAgICAgICAgIGZwcmludGYgKHN0ZGVyciwgIkVycm9y
IGluIGRidXNfbWVzc2FnZV9uZXdfbWV0aG9kX3JldHVyblxuIik7CiAgICAgICAgICAgICAg
ICAgICAgICAgIGV4aXQgKDEpOwogICAgICAgICAgICAgICAgICAgIH0KCiAgICAgICAgICAg
ICAgICAgICAgREJ1c01lc3NhZ2VJdGVyIGl0ZXI7CiAgICAgICAgICAgICAgICAgICAgZGJ1
c19tZXNzYWdlX2l0ZXJfaW5pdF9hcHBlbmQgKHJlcGx5LCAmaXRlcik7CiAgICAgICAgICAg
ICAgICAgICAgY2hhciAqcHRyID0gYW5zd2VyOwogICAgICAgICAgICAgICAgICAgIGlmICgh
ZGJ1c19tZXNzYWdlX2l0ZXJfYXBwZW5kX2Jhc2ljICgmaXRlciwgREJVU19UWVBFX1NUUklO
RywgJnB0cikpIHsKICAgICAgICAgICAgICAgICAgICAgICAgZnByaW50ZiAoc3RkZXJyLCAi
RXJyb3IgaW4gZGJ1c19tZXNzYWdlX2l0ZXJfYXBwZW5kX2Jhc2ljXG4iKTsKICAgICAgICAg
ICAgICAgICAgICAgICAgZXhpdCAoMSk7CiAgICAgICAgICAgICAgICAgICAgfQoKICAgICAg
ICAgICAgICAgICAgICBpZiAoIWRidXNfY29ubmVjdGlvbl9zZW5kIChjb25uLCByZXBseSwg
TlVMTCkpIHsKICAgICAgICAgICAgICAgICAgICAgICAgZnByaW50ZiAoc3RkZXJyLCAiRXJy
b3IgaW4gZGJ1c19jb25uZWN0aW9uX3NlbmRcbiIpOwogICAgICAgICAgICAgICAgICAgICAg
ICBleGl0ICgxKTsKICAgICAgICAgICAgICAgICAgICB9CgogICAgICAgICAgICAgICAgICAg
IGRidXNfY29ubmVjdGlvbl9mbHVzaCAoY29ubik7CgogICAgICAgICAgICAgICAgICAgIGRi
dXNfbWVzc2FnZV91bnJlZiAocmVwbHkpOwogICAgICAgICAgICAgICAgfQogICAgICAgICAg
ICAgICAgZWxzZSAvLyBUaGVyZSB3YXMgYW4gZXJyb3IKICAgICAgICAgICAgICAgIHsKICAg
ICAgICAgICAgICAgICAgICBEQnVzTWVzc2FnZSAqZGJ1c19lcnJvcl9tc2c7CiAgICAgICAg
ICAgICAgICAgICAgY2hhciBlcnJvcl9tc2cgW10gPSAiRXJyb3IgaW4gaW5wdXQiOwogICAg
ICAgICAgICAgICAgICAgIGlmICgoZGJ1c19lcnJvcl9tc2cgPSBkYnVzX21lc3NhZ2VfbmV3
X2Vycm9yIChtZXNzYWdlLCBEQlVTX0VSUk9SX0ZBSUxFRCwgZXJyb3JfbXNnKSkgPT0gTlVM
TCkgewogICAgICAgICAgICAgICAgICAgICAgICAgZnByaW50ZiAoc3RkZXJyLCAiRXJyb3Ig
aW4gZGJ1c19tZXNzYWdlX25ld19lcnJvclxuIik7CiAgICAgICAgICAgICAgICAgICAgICAg
ICBleGl0ICgxKTsKICAgICAgICAgICAgICAgICAgICB9CgogICAgICAgICAgICAgICAgICAg
IGlmICghZGJ1c19jb25uZWN0aW9uX3NlbmQgKGNvbm4sIGRidXNfZXJyb3JfbXNnLCBOVUxM
KSkgewogICAgICAgICAgICAgICAgICAgICAgICBmcHJpbnRmIChzdGRlcnIsICJFcnJvciBp
biBkYnVzX2Nvbm5lY3Rpb25fc2VuZFxuIik7CiAgICAgICAgICAgICAgICAgICAgICAgIGV4
aXQgKDEpOwogICAgICAgICAgICAgICAgICAgIH0KCiAgICAgICAgICAgICAgICAgICAgZGJ1
c19jb25uZWN0aW9uX2ZsdXNoIChjb25uKTsKCiAgICAgICAgICAgICAgICAgICAgZGJ1c19t
ZXNzYWdlX3VucmVmIChkYnVzX2Vycm9yX21zZyk7CiAgICAgICAgICAgICAgICB9CiAgICAg
ICAgICAgIH0KICAgICAgICAgICAgZWxzZQogICAgICAgICAgICB7CiAgICAgICAgICAgICAg
ICBwcmludF9kYnVzX2Vycm9yICgiRXJyb3IgZ2V0dGluZyBtZXNzYWdlIik7CiAgICAgICAg
ICAgIH0KICAgICAgICB9CiAgICB9CgogICAgcmV0dXJuIDA7Cn0KCgpib29sIGlzaW50ZWdl
ciAoY2hhciAqcHRyKQp7CgogICAgaWYgKCpwdHIgPT0gJysnIHx8ICpwdHIgPT0gJy0nKQog
ICAgICAgIHB0cisrOwoKICAgIHdoaWxlICgqcHRyKSB7CiAgICAgICAgaWYgKCFpc2RpZ2l0
ICgoaW50KSAqcHRyKyspKQogICAgICAgICAgICByZXR1cm4gZmFsc2U7CiAgICB9CgogICAg
cmV0dXJuIHRydWU7Cn0KCnZvaWQgcHJpbnRfZGJ1c19lcnJvciAoY2hhciAqc3RyKQp7CiAg
ICBmcHJpbnRmIChzdGRlcnIsICIlczogJXNcbiIsIHN0ciwgZGJ1c19lcnJvci5tZXNzYWdl
KTsKICAgIGRidXNfZXJyb3JfZnJlZSAoJmRidXNfZXJyb3IpOwp9Cg==

--------------lfxjid6HiUkNX8zrTQoMgPQp--
