Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 035F0295D80
	for <lists+openbmc@lfdr.de>; Thu, 22 Oct 2020 13:39:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CH53y15KRzDqpH
	for <lists+openbmc@lfdr.de>; Thu, 22 Oct 2020 22:39:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=maciej.lawniczak@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CH52N2z2hzDqrs
 for <openbmc@lists.ozlabs.org>; Thu, 22 Oct 2020 22:37:41 +1100 (AEDT)
IronPort-SDR: m2lwEKoeRW5JoePb5aMq3dXdhb9sPOWq+D+3EpCToM7ZYZuztQuYg0oVlCwZx7BtqaSJxtzHQU
 zX61JXhD4tgg==
X-IronPort-AV: E=McAfee;i="6000,8403,9781"; a="147369197"
X-IronPort-AV: E=Sophos;i="5.77,404,1596524400"; 
 d="md'?scan'208,217";a="147369197"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2020 04:37:37 -0700
IronPort-SDR: sFHEnxzPPpNqP6Y6rFh+fXapvxji9gXPdgmWRue/FiOFKWo4jbB8V+YQPuKTOc5qsnsV7u8/Ou
 YVvaf0fmtTyw==
X-IronPort-AV: E=Sophos;i="5.77,404,1596524400"; 
 d="md'?scan'208,217";a="466656518"
Received: from mlawnicz-mobl.ger.corp.intel.com (HELO [10.249.135.39])
 ([10.249.135.39])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2020 04:37:36 -0700
Subject: Re: Installing Windows Server 2019 from a remotely mounted ISO
To: Thaj <tajudheenk@gmail.com>, Alexander Amelkin <a.amelkin@yadro.com>
References: <60926e52-9d00-2b20-e8ac-7fd515ddac78@yadro.com>
 <CAH2KKeaBMhU3XDADDE0ieqRRhNBiF57-9rUi+Go-SSJCGG-GBA@mail.gmail.com>
From: Maciej Lawniczak <maciej.lawniczak@linux.intel.com>
Message-ID: <3c0b0dc3-a31d-dcfb-608b-53436074397b@linux.intel.com>
Date: Thu, 22 Oct 2020 13:37:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <CAH2KKeaBMhU3XDADDE0ieqRRhNBiF57-9rUi+Go-SSJCGG-GBA@mail.gmail.com>
Content-Type: multipart/mixed; boundary="------------F24ADFBDD98FF0231A9BC20E"
Content-Language: en-US
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------F24ADFBDD98FF0231A9BC20E
Content-Type: multipart/alternative;
 boundary="------------FD0D19BD6BDDD0D5A3714898"


--------------FD0D19BD6BDDD0D5A3714898
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Mounting DVD-based ISOs in Intel-BMC Virtual Media is not supported by 
underlying USB Mass Storage gadget. To mount such iso files they need to 
be converted to MBR/FAT32 image. Attached instruction shows two ways of 
preparing such image.

On 10/21/2020 9:32 AM, Thaj wrote:
> Hi Alexander, I am also facing the same issue. Did you find any 
> workaround for this ?
>
> On Mon, May 25, 2020 at 4:04 PM Alexander Amelkin <a.amelkin@yadro.com 
> <mailto:a.amelkin@yadro.com>> wrote:
>
>     Hi all!
>
>     We're trying to install Windows Server 2019 from an ISO image
>     mounted as
>     remote media via OpenBMC WebUI.
>
>     The Windows installer boots, but then says that a media driver is
>     missing.
>
>     Are there any hints on how to accomplish the task?
>
>     Attached is the screenshot of the message we get with Windows
>     Server 2019.
>
>     With best regards,
>     Alexander.
>
>     P.S. We're using Intel-BMC version of OpenBMC for the task, but it
>     looks
>     like the remote media part is more or less the same.
>

--------------FD0D19BD6BDDD0D5A3714898
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><!--[if gte mso 9]><xml>
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
</xml><![endif]-->Mounting DVD-based ISOs in Intel-BMC Virtual Media is
      not
      supported by underlying USB Mass Storage gadget. To mount such iso
      files they
      need to be converted to MBR/FAT32 image. Attached instruction
      shows two ways of
      preparing such image.
    </p>
    <div class="moz-cite-prefix">On 10/21/2020 9:32 AM, Thaj wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAH2KKeaBMhU3XDADDE0ieqRRhNBiF57-9rUi+Go-SSJCGG-GBA@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">Hi Alexander, I am also facing the same issue. Did
        you find any workaround for this ?</div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Mon, May 25, 2020 at 4:04
          PM Alexander Amelkin &lt;<a href="mailto:a.amelkin@yadro.com"
            moz-do-not-send="true">a.amelkin@yadro.com</a>&gt; wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi
          all!<br>
          <br>
          We're trying to install Windows Server 2019 from an ISO image
          mounted as <br>
          remote media via OpenBMC WebUI.<br>
          <br>
          The Windows installer boots, but then says that a media driver
          is missing.<br>
          <br>
          Are there any hints on how to accomplish the task?<br>
          <br>
          Attached is the screenshot of the message we get with Windows
          Server 2019.<br>
          <br>
          With best regards,<br>
          Alexander.<br>
          <br>
          P.S. We're using Intel-BMC version of OpenBMC for the task,
          but it looks <br>
          like the remote media part is more or less the same.<br>
          <br>
        </blockquote>
      </div>
    </blockquote>
  </body>
</html>

--------------FD0D19BD6BDDD0D5A3714898--

--------------F24ADFBDD98FF0231A9BC20E
Content-Type: text/plain; charset=UTF-8;
 name="mounting_windows_iso.md"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="mounting_windows_iso.md"

IyBNb3V0aW5nIFdpbmRvd3MgSVNPIGltYWdlIGluIE9wZW5CTUMgVmlydHVhbE1lZGlhCgpP
cGVuQk1DIGltcGxlbWVudGF0aW9uIG9mIFZpcnR1YWxNZWRpYSBmdW5jdGlvbmFsaXR5IGlz
IGJhc2VkIG9uIG9wZW4gc291cmNlCiBbTWFzcyBTdG9yYWdlIEdhZGdldF0oaHR0cHM6Ly93
d3cua2VybmVsLm9yZy9kb2MvaHRtbC9sYXRlc3QvdXNiL21hc3Mtc3RvcmFnZS5odG1sKS4K
SXQgaGFzIGtub3duIGxpbWl0YXRpb24gb2Ygbm8gc3VwcG9ydCBmb3IgRFZEIElTTyBpbWFn
ZXMuCgpCeSBkZXNpZ24gVmlydHVhbE1lZGlhIHdpbGwgbW91bnQgYWxsIHNlcnZlZCBpbWFn
ZXMgYXMgVVNCIE1hc3MgU3RvcmFnZSBkZXZpY2UKZm9yIGNvbXBhdGliaWxpdHkuIFdoaWxl
IHRoaXMgZG9lc24ndCBhZmZlY3QgbW9kZXJuIElTTyBpbWFnZXMgZm9yIExpbnV4CmRpc3Ry
aWJ1dGlvbnMsIFdpbmRvd3MgaW5zdGFsbGVyIGlzIHNlbnNpdGl2ZSB0byB0aGUgbWVkaXVt
IGl0J3MgYm9vdGVkIGZyb20uCgpUbyB2ZXJpZnkgaWYgSVNPIHlvdSdyZSB0cnlpbmcgdG8g
bW91bnQgaXMgYSBDRC9EVkQgaW1hZ2UgZXhlY3V0ZSBmb2xsb3dpbmcKY29tbWFuZDoKYGBg
YmFzaApmaWxlIDxwYXRoIHRvIGlzbz4KIyBDRC9EVkQgaW1hZ2Ugd2lsbCByZXBvcnQgJ0lT
TyA5NjYwIENELVJPTWAKIyBNYXNzIFN0b3JhZ2UgY29tcGF0aWJsZSBJU08gd2lsbCB1c3Vh
bGx5IHJlcG9ydCAnRE9TL01CUicKYGBgCgojIyBXaW5kb3dzIGluc3RhbGxhdGlvbiBpbiBP
cGVuQk1DIFZpcnR1YWxNZWRpYQpXaW5kb3dzIElTTyBpbWFnZXMgYXJlIG1lYW50IHRvIGJl
IG1vdW50ZWQgaW4gZm9sbG93aW5nIHdheXM6Ci0gRFZEIGJ1cm5lZCBkaXJlY3RseSBmcm9t
IElTTwotIFVTQiBkZXZpY2UgcHJlcGFyZWQgYnkgV2luZG93cyBNZWRpYSBDcmVhdGlvbiBU
b29sCgpOb25lIG9mIHRoZXNlIGFyZSBhcHBsaWNhYmxlIG91dCBvZiB0aGUgYm94IGZvciBP
cGVuQk1DIFZpcnR1YWxNZWRpYSwgc28KZm9sbG93aW5nIHByZXBhcmF0aW9uIGlzIG5lZWRl
ZDoKCiMjIyBPcHRpb24gMTogQ3JlYXRlIFVTQiBpbnN0YWxsYXRpb24gZGlzayBvbiBXaW5k
b3dzIGFuZCBkdW1wIGRyaXZlIGltYWdlCmBgYApJbWFnZSBzaXplIGNvbnNpZGVyYXRpb24K
ClBsZWFzZSBub3RlIHRoYXQgdGhpcyBtZXRob2Qgd2lsbCBjcmVhdGUgaW1hZ2Ugb2YgdGhl
IHdob2xlIHBhcnRpdGlvbi4gQnkgZGVmYXVsdCBpdCBtZWFucyB0aGF0IHJlc3VsdGFudCBp
bWFnZSB3aWxsIGhhdmUgc2l6ZSBvZiB5b3VyIHdob2xlIFVTQiBkcml2ZSB1c2VkIGZvciB0
aGUgb3BlcmF0aW9uICgxNkdCIGltYWdlIGZvciAxNkdCIFVTQiBkcml2ZSkuCgpUbyBrZWVw
IGltYWdlIHNpemUgYXMgc21hbGwgYXMgcG9zc2libGUgaXQncyBiZXN0IHRvIHVzZSB1c2Ug
c21hbGxlc3QgZHJpdmUgcG9zc2libGUgKHByZWZlcmFibHkgOEdCKSBmb3IgaW1hZ2UgY3Jl
YXRpb24uCkFub3RoZXIgKG1vcmUgYWR2YW5jZWQpIG9wdGlvbiBpcyB0byBjcmVhdGUvc2hy
aW5rIHBhcnRpdGlvbiBvbiBVU0IgZHJpdmUgdG8gcHJlZmVycmVkIHNpemUsIGJ1dCBrZWVw
IGluIG1pbmQgdGhhdCBpdCB3b3VsZCByZXF1aXJlIHJvbGxpbmcgYmFjayBhZnRlciBvcGVy
YXRpb24gdG8gcmVzdG9yZSBmdWxsIFVTQiBkcml2ZSBjYXBhY2l0eS4KCklmIHlvdSB3YW50
IHRvIGhhdmUgZnVsbCBjb250cm9sIG92ZXIgaW1hZ2Ugc2l6ZSBhbmQgZG9uJ3Qgd2FudCB0
byBtb2RpZnkgeW91ciBVU0IgZHJpdmUsIHBsZWFzZSBjaGVjayAnT3B0aW9uIDInLCBhcyBp
dCBjb3ZlcnMgbWFudWFsIGNvbnZlcnNpb24gb2YgaW1hZ2Ugd2l0aG91dCBuZWVkIG9mIGFu
eSBVU0IgZGV2aWNlLgpgYGAKCklmIFdpbmRvd3MgTWVkaWEgQ3JlYXRpb24gVG9vbCBpcyBu
b3QgYXZhaWxhYmxlIGZvciB5b3VyIHZlcnNpb24gb2YgV2luZG93cywKZm9sbG93IFtpbnN0
cnVjdGlvbnMgZnJvbSBNaWNyb3NvZnRdKGh0dHBzOi8vZG9jcy5taWNyb3NvZnQuY29tL2Vu
LXVzL3dpbmRvd3MtaGFyZHdhcmUvbWFudWZhY3R1cmUvZGVza3RvcC9pbnN0YWxsLXdpbmRv
d3MtZnJvbS1hLXVzYi1mbGFzaC1kcml2ZSkuCkluIHNob3J0OgoxLiBGb3JtYXQgeW91ciBV
U0IgZHJpdmUgYXMgRkFUMzIgJ0FjdGl2ZScgcGFydGl0aW9uCjIuIE1vdW50IElTTyBpbiB0
aGUgc3lzdGVtIChXaW5kb3dzIGhhdmUgYnVpbHQtaW4gc3VwcG9ydCBmb3IgdGhhdCkKMy4g
VXNpbmcgbGlua2VkIGluc3RydWN0aW9uIGNvcHkgb3ZlciBJU08gY29udGVudHMgdG8geW91
ciBVU0IgZHJpdmUKICAgLSBjb3B5IGFsbCBmaWxlcyBsZXNzIHRoYW4gNEdCIGRpcmVjdGx5
CiAgIC0gc3BsaXQgYHNvdXJjZXMvaW5zdGFsbC53aW1gIGZpbGUgaW50byBtdWx0aXBsZSBg
LnN3bWAgZmlsZXMKCkR1bXAgbmV3bHkgcG9wdWxhdGVkIEZBVDMyIHBhcnRpdGlvbiBpbnRv
IGltYWdlLiBUaGVyZSBhcmUgdmFyaW91cyB0b29scyB0byBhY2hpZXZlCnRoYXQsIHlvdSBj
YW4gdXNlIGZvbGxvd2luZyBzb2x1dGlvbiBiYXNlZCBvbiBgQ3lnd2luYDoKMS4gSW5zdGFs
bCBDeWd3aW4gZnJvbSBodHRwczovL2N5Z3dpbi5jb20vaW5zdGFsbC5odG1sCjIuIEZpbmQg
eW91ciBGQVQzMiBwYXJ0aXRpb24gYnkgZXhlY3V0aW5nIGNvbW1hbmQ6CmBgYGJhc2gKY2F0
IC9wcm9jL3BhcnRpdGlvbnMKYGBgCiAgIC0gRmluZCBkZXZpY2UgZGVzY3JpcHRvciBmb3Ig
eW91ciBVU0IgRHJpdmUsIGluIHRoaXMgc3lzdGVtIGl0IGhhcyBsZXR0ZXIg4oCYRDpc4oCZ
IGFzc2lnbmVkCmBgYGJhc2gKc2RiMSAgIEQ6XApgYGAKMy4gQ3JlYXRlIGltYWdlIG9mIHRo
ZSBwYXJ0aXRpb24gd2l0aCBmb2xsb3dpbmcgY29tbWFuZCwKYGBgYmFzaApkZCBpZj0vZGV2
LyoqKiBjb252PXN5bmMsbm9lcnJvciBicz02NEsgc3RhdHVzPXByb2dyZXNzIG9mPSoqKgpg
YGAKQXNzdW1pbmcgeW91ciBkcml2ZSBpcyBhdCBgL2Rldi9zZGIxYCwgYW5kIGltYWdlIHNo
b3VsZCBiZSBwbGFjZWQgYXQgYEM6XFVzZXJzXEFkbWluXERvY3VtZW50c1xkaXNrX2ltYWdl
LmltZ2A6CmBgYGJhc2gKZGQgaWY9L2Rldi9zZGIxIGNvbnY9c3luYyxub2Vycm9yIGJzPTY0
SyBzdGF0dXM9cHJvZ3Jlc3Mgb2Y9L2N5Z2RyaXZlL2MvVXNlcnMvQWRtaW4vRG9jdW1lbnRz
L2Rpc2tfaW1hZ2UuaW1nCmBgYAoKIyMjIE9wdGlvbiAyOiBDb252ZXJ0IElTTyB0byBGQVQz
MiBkaXNrIGltYWdlIG9uIExpbnV4CmBgYApGb2xsb3dpbmcgaW5zdHJ1Y3Rpb24gaXMgYmFz
ZWQgb24gVWJ1bnR1IDE4LjA0LCBidXQgc2hvdWxkIGJlIGFwcGxpY2FibGUKdG8gd2lkZSBy
YW5nZSBvZiBtb2Rlcm4gR05VL0xpbnV4IG9wZXJhdGluZyBzeXN0ZW1zLgoKSXQgcmVxdWly
ZXMgd2ltdG9vbHMgYW5kIDd6aXAsIHdoaWNoIGNhbiBiZSBpbnN0YWxsZWQgYXMgc3VjaDoK
c3VkbyBhcHQgaW5zdGFsbCBwN3ppcC1mdWxsIHdpbXRvb2xzCmBgYAojIyMjIFVucGFjayBp
bWFnZSB0byAnaXNvJyBkaXJlY3RvcnkKYGBgYmFzaAojIDd6aXAgcGFja2FnZSBzaG91bGQg
YmUgYXZhaWxhYmxlIGluIGFsbCBtb2Rlcm4gTGludXggZGlzdHJpYnV0aW9ucwo3eiB4IDxw
YXRoX3RvX2lzbz4gLW9pc28KYGBgCgojIyMjIENyZWF0ZSBlbXB0eSBpbWFnZSBmcm9tX2lz
by5pbWcKYGBgYmFzaAojIDggZ2Igc2hvdWxkIGJlIHN1aXRhYmxlIGZvciBkb3VibGUgZGVu
c2l0eSBEVkQsIGJ1dCBjYW4gYmUgZGVjcmVhc2VkIHRvIGZpdCB0aGUgaW1hZ2UKZGQgaWY9
L2Rldi96ZXJvIG9mPWZyb21faXNvLmltZyBjb3VudD04IGJzPTFHCmBgYAoKIyMjIyBDcmVh
dGUgRkFUMzIgcGFydGl0aW9uCmBgYGJhc2gKIyBJbnRlcmFjdGl2ZSB0b29sIHdpbGwgcmVx
dWlyZSBmb2xsb3dpbmcgaW5wdXRzOgojIG4gPGVudGVyPiA8ZW50ZXI+IDxlbnRlcj4gPGVu
dGVyPiB0IGMgdwpmZGlzayBmcm9tX2lzby5pbWcKYGBgCgpgYGBiYXNoCkNoYW5nZXMgd2ls
bCByZW1haW4gaW4gbWVtb3J5IG9ubHksIHVudGlsIHlvdSBkZWNpZGUgdG8gd3JpdGUgdGhl
bS4KQmUgY2FyZWZ1bCBiZWZvcmUgdXNpbmcgdGhlIHdyaXRlIGNvbW1hbmQuCgpEZXZpY2Ug
ZG9lcyBub3QgY29udGFpbiBhIHJlY29nbml6ZWQgcGFydGl0aW9uIHRhYmxlLgpDcmVhdGVk
IGEgbmV3IERPUyBkaXNrbGFiZWwgd2l0aCBkaXNrIGlkZW50aWZpZXIgMHg4NGE2YmQyMC4K
CiMgdHlwZSAnbicKQ29tbWFuZCAobSBmb3IgaGVscCk6IG4KUGFydGl0aW9uIHR5cGUKICAg
cCAgIHByaW1hcnkgKDAgcHJpbWFyeSwgMCBleHRlbmRlZCwgNCBmcmVlKQogICBlICAgZXh0
ZW5kZWQgKGNvbnRhaW5lciBmb3IgbG9naWNhbCBwYXJ0aXRpb25zKQojIHR5cGUgPGVudGVy
PgpTZWxlY3QgKGRlZmF1bHQgcCk6CgpVc2luZyBkZWZhdWx0IHJlc3BvbnNlIHAuCiMgdHlw
ZSA8ZW50ZXI+ClBhcnRpdGlvbiBudW1iZXIgKDEtNCwgZGVmYXVsdCAxKToKIyB0eXBlIDxl
bnRlcj4KRmlyc3Qgc2VjdG9yICgyMDQ4LTE2Nzc3MjE1LCBkZWZhdWx0IDIwNDgpOgojIHR5
cGUgPGVudGVyPgpMYXN0IHNlY3RvciwgK3NlY3RvcnMgb3IgK3NpemV7SyxNLEcsVCxQfSAo
MjA0OC0xNjc3NzIxNSwgZGVmYXVsdCAxNjc3NzIxNSk6CgpDcmVhdGVkIGEgbmV3IHBhcnRp
dGlvbiAxIG9mIHR5cGUgJ0xpbnV4JyBhbmQgb2Ygc2l6ZSA4IEdpQi4KCiMgdHlwZSAndCcK
Q29tbWFuZCAobSBmb3IgaGVscCk6IHQKU2VsZWN0ZWQgcGFydGl0aW9uIDEKIyB0eXBlICdj
JwpIZXggY29kZSAodHlwZSBMIHRvIGxpc3QgYWxsIGNvZGVzKTogYwpDaGFuZ2VkIHR5cGUg
b2YgcGFydGl0aW9uICdMaW51eCcgdG8gJ1c5NSBGQVQzMiAoTEJBKScuCgojIHR5cGUgJ3cn
CkNvbW1hbmQgKG0gZm9yIGhlbHApOiB3ClRoZSBwYXJ0aXRpb24gdGFibGUgaGFzIGJlZW4g
YWx0ZXJlZC4KU3luY2luZyBkaXNrcy4KYGBgCgojIyMjIEZvcm1hdCBmaWxlc3lzdGVtcwpg
YGBiYXNoCm1rZnMudmZhdCBmcm9tX2lzby5pbWcKYGBgCgojIyMjIE1vZGlmeSBJU08gY29u
dGVudHMgdG8gZml0IGludG8gRkFUMzIgcGFydGl0aW9uCmBgYGJhc2gKd2ltbGliLWltYWdl
eCBzcGxpdCAiLi9pc28vc291cmNlcy9pbnN0YWxsLndpbSIgIiQocHdkKS9pc28vc291cmNl
cy9pbnN0YWxsLnN3bSIgNDAwMApgYGAKCmBgYApXQVJOSU5HOgpOZXh0IGNvbW1hbmRzIHNo
b3VsZCBiZSBwZXJmb3JtZWQgYXMgJ3Jvb3QnIHVzZXIuClR5cGUgJ3N1ZG8gLXMnIHRvIHN3
aXRjaCB0byByb290IHNlc3Npb24sIHR5cGUgJ2V4aXQnIGFmdGVyd2FyZHMuCmBgYAoKIyMj
IyBDb3B5IElTTyBjb250ZW50cyB0byBuZXdseSBjcmVhdGVkIGltYWdlCmBgYGJhc2gKbWtk
aXIgbW91bnRlZAptb3VudCBmcm9tX2lzby5pbWcgbW91bnRlZApyc3luYyAtcnYgLS1leGNs
dWRlPSJzb3VyY2VzL2luc3RhbGwud2ltIiAuL2lzby8gLi9tb3VudGVkCmBgYAoKIyMjIyBV
bm1vdW50IGRldmljZXMKYGBgYmFzaAojIEVuc3VyZSB0aGF0IGV2ZXJ5dGhpbmcgaGFzIGJl
ZW4gd3JpdHRlbiB0byBkaXNrCnN5bmMKc3luYwp1bW91bnQgbW91bnRlZApgYGA=
--------------F24ADFBDD98FF0231A9BC20E--
