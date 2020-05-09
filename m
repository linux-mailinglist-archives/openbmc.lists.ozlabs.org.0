Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9CC1CC46A
	for <lists+openbmc@lfdr.de>; Sat,  9 May 2020 22:09:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49KJFq6TLszDr48
	for <lists+openbmc@lfdr.de>; Sun, 10 May 2020 06:09:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=richard.marian.thomaiyar@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49KJDy2MH8zDr2q
 for <openbmc@lists.ozlabs.org>; Sun, 10 May 2020 06:09:06 +1000 (AEST)
IronPort-SDR: qbcctFDM7FJqDJWwIT+FCnKMeNINvr9VGdWU5sojGdrX3h92FicEaECLF5zDoDP+6GUejLJKBF
 Nr6eqiGw/+1g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2020 13:07:50 -0700
IronPort-SDR: wfvKnsLfhOVQMD3N2pqUkRktbzBRNwqzVdIHRf4sEQeTBNxJALORQfKncwbhQVhjRw8Cdbc8sh
 sK7H2ctaEG8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,373,1583222400"; 
 d="scan'208,217";a="462670341"
Received: from rthomaiy-mobl2.gar.corp.intel.com (HELO [10.251.48.111])
 ([10.251.48.111])
 by fmsmga005.fm.intel.com with ESMTP; 09 May 2020 13:07:47 -0700
Subject: Re: Multiple BMCs in a system: IPMB? Redfish? MCTP?
To: Vijay Khemka <vijaykhemka@fb.com>, Nancy Yuen <yuenn@google.com>,
 Andrew Jeffery <andrew@aj.id.au>
References: <CADfYTpG8Jp6rkQXnAeRjyAf41jzrJa0sPHmc7K0gbR7=EigQNw@mail.gmail.com>
 <f197f55c-f7f2-c405-f3c8-bfbd5cd5e3bd@linux.vnet.ibm.com>
 <789e1bda-63d4-479e-bfa3-12bf1603ebbc@www.fastmail.com>
 <CADfYTpGNRJ3Yk6h7K4iw27jn4c4VqNKnHw0PLMHyG5h+O7cQ6Q@mail.gmail.com>
 <933294DA-9290-4A33-970F-7DD723BA178B@fb.com>
From: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Message-ID: <68264f4b-35a0-6c2b-67ab-9fb0f314269f@linux.intel.com>
Date: Sun, 10 May 2020 01:37:46 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <933294DA-9290-4A33-970F-7DD723BA178B@fb.com>
Content-Type: multipart/alternative;
 boundary="------------76301776A0299F504B8D3960"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------76301776A0299F504B8D3960
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

PICMG has defined certain specifications in this angle (HPM), but those 
basically uses IPMI (PICMG group extension commands)

1. Physical interface (i2c/IPMB) - IPMI

2. LAN Channel - IPMI RMCP+ other Direct stuff for say console access etc.

PICMG started working with DMTF redfish for the purpose of IPMC to IPMC 
communication few years before (but not sure where it stands now)

No one solution will fit for all, and need to consider based on 1. 
Features required (ssh / serial console access / SOL / KVM etc.) and 2. 
Physical interface between the controller (I2C/ LAN / others?) . Nancy / 
Vijay??

Say, with i2c- anything related to SSH / KVM forwarding etc is going to 
be a problem, but with LAN these can be addressed.

With i2c-> IPMB / PLDM  (MCTP over smbus) (with IPMI moving out of 
picture PLDM will be better alternative).

With LAN -> PLDM / Redfish. (Using Redfish has advantage over PLDM for 
RDE, and still other features can be supported)

Apart from this, need to define fail-over management(PICMG defined some) 
/ discovery(MCTP offers some) etc.

Regards,

Richard


On 5/8/2020 10:48 PM, Vijay Khemka wrote:
>
> *From: *openbmc <openbmc-bounces+vijaykhemka=fb.com@lists.ozlabs.org> 
> on behalf of Nancy Yuen <yuenn@google.com>
> *Date: *Thursday, May 7, 2020 at 12:47 PM
> *To: *Andrew Jeffery <andrew@aj.id.au>
> *Cc: *OpenBMC Maillist <openbmc@lists.ozlabs.org>
> *Subject: *Re: Multiple BMCs in a system: IPMB? Redfish? MCTP?
>
> On Mon, May 4, 2020 at 3:31 AM Andrew Jeffery <andrew@aj.id.au 
> <mailto:andrew@aj.id.au>> wrote:
>
>
>
>     On Thu, 30 Apr 2020, at 17:08, Deepak Kodihalli wrote:
>     > On 30/04/20 4:21 am, Nancy Yuen wrote:
>     > > I've talked with some people a while back (long while back) about
>     > > multiple BMCs in a system.  Either for redundancy or managing
>     separate
>     > > parts of a system.   I'm wondering what other people are
>     thinking in
>     > > this area if at all.
>     > >
>     > > We are considering similar designs and I'm looking into
>     options for
>     > > BMC-BMC communications.  Some BMCs may not be externally
>     > > accessible. Here are some options that we've looked at:
>     > >
>     > >  1. i2c/IPMB
>     > >  2. usbnet/Redfish
>     > >  3. i2c/MCTP/PLDM or something else?
>     > >  4. internal network via switch chip/Redfish or MCTP
>     > >
>     > >   I'd like to reduce our use of IPMI so I want to avoid (1).
>     > >
>     > > ----------
>     > > Nancy
>     >
>     > Hi Nancy,
>     >
>     > I think it depends on whether the BMCs need to talk to each
>     other for
>     > platform management, or if they manage their own hosts and we
>     need one
>     > of the BMCs to broadcast out of band requests and aggregate
>     responses.
>     >
>     > For the former I think PLDM over MCTP could be a good fit. This
>     is more
>     > of an "inband" use-case in my opinion so I'm not sure if Redfish
>     is well
>     > suited. For the latter, a Redfish based aggregation is a good
>     option.
>
>     I think this looks like the right approach. Certainly some thought
>     would be
>     required in designing the MCTP networks given the (intentionally)
>     limited
>     number of endpoint IDs.
>
>     Andrew
>
> Hi Andrew, Deepak,
>
> Sorry for the delayed response!
>
> For the purposes of this discussion I have BMCs managing their own 
> host: BMC3<--->BMC2<--->BMC1/controller<--> external.  I wrote BMC1 
> but there maybe some other controller there that isn't strictly a 
> BMC.  BMC2 would be "passing through" information between BMC1 and 
> BMC3. But I don't necessarily want BMC2 to do any form of aggregation 
> from information from BMC3.  For BMC1/Controller and BMC 2 we are 
> thinking Redfish.
>
> In my case I'm interested in what ways people are thinking BMC2 and 
> BMC3 should be connected and speaking to each other. Is MCTP/PLDM 
> where everyone is leaning?
>
> Nancy,
>
> What is connectivity between BMC1, BMC2 and BMC3. Are these exposing 
> any out of band connections. For security reasons, aggregator should 
> use inband connectivity between BMCs and as Deepak said MCTP is good 
> option for inband.
>

--------------76301776A0299F504B8D3960
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>PICMG has defined certain specifications in this angle (HPM), but
      those basically uses IPMI (PICMG group extension commands)<br>
    </p>
    <p>1. Physical interface (i2c/IPMB) - IPMI</p>
    <p>2. LAN Channel - IPMI RMCP+ other Direct stuff for say console
      access etc.<br>
    </p>
    <p>PICMG started working with DMTF redfish for the purpose of IPMC
      to IPMC communication few years before (but not sure where it
      stands now)<br>
    </p>
    <p>No one solution will fit for all, and need to consider based on
      1. Features required (ssh / serial console access / SOL / KVM
      etc.) and 2. Physical interface between the controller (I2C/ LAN /
      others?) . Nancy / Vijay??<br>
    </p>
    <p>Say, with i2c- anything related to SSH / KVM forwarding etc is
      going to be a problem, but with LAN these can be addressed.<br>
    </p>
    <p>With i2c-&gt; IPMB / PLDM  (MCTP over smbus) (with IPMI moving
      out of picture PLDM will be better alternative).</p>
    <p>With LAN -&gt; PLDM / Redfish. (Using Redfish has advantage over
      PLDM for RDE, and still other features can be supported)<br>
    </p>
    <p>Apart from this, need to define fail-over management(PICMG
      defined some) / discovery(MCTP offers some) etc.<br>
    </p>
    <p>Regards,</p>
    <p>Richard<br>
    </p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/8/2020 10:48 PM, Vijay Khemka
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:933294DA-9290-4A33-970F-7DD723BA178B@fb.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta name="Generator" content="Microsoft Word 15 (filtered
        medium)">
      <style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style>
      <div class="WordSection1">
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <div style="border:none;border-top:solid #B5C4DF
          1.0pt;padding:3.0pt 0in 0in 0in">
          <p class="MsoNormal"><b><span
                style="font-size:12.0pt;color:black">From: </span></b><span
              style="font-size:12.0pt;color:black">openbmc
              <a class="moz-txt-link-rfc2396E" href="mailto:openbmc-bounces+vijaykhemka=fb.com@lists.ozlabs.org">&lt;openbmc-bounces+vijaykhemka=fb.com@lists.ozlabs.org&gt;</a>
              on behalf of Nancy Yuen <a class="moz-txt-link-rfc2396E" href="mailto:yuenn@google.com">&lt;yuenn@google.com&gt;</a><br>
              <b>Date: </b>Thursday, May 7, 2020 at 12:47 PM<br>
              <b>To: </b>Andrew Jeffery <a class="moz-txt-link-rfc2396E" href="mailto:andrew@aj.id.au">&lt;andrew@aj.id.au&gt;</a><br>
              <b>Cc: </b>OpenBMC Maillist
              <a class="moz-txt-link-rfc2396E" href="mailto:openbmc@lists.ozlabs.org">&lt;openbmc@lists.ozlabs.org&gt;</a><br>
              <b>Subject: </b>Re: Multiple BMCs in a system: IPMB?
              Redfish? MCTP?<o:p></o:p></span></p>
        </div>
        <div>
          <p class="MsoNormal"><o:p> </o:p></p>
        </div>
        <div>
          <p class="MsoNormal"><o:p> </o:p></p>
          <div>
            <div>
              <p class="MsoNormal">On Mon, May 4, 2020 at 3:31 AM Andrew
                Jeffery &lt;<a href="mailto:andrew@aj.id.au"
                  moz-do-not-send="true">andrew@aj.id.au</a>&gt; wrote:<o:p></o:p></p>
            </div>
            <blockquote style="border:none;border-left:solid #CCCCCC
              1.0pt;padding:0in 0in 0in
              6.0pt;margin-left:4.8pt;margin-right:0in">
              <p class="MsoNormal"><br>
                <br>
                On Thu, 30 Apr 2020, at 17:08, Deepak Kodihalli wrote:<br>
                &gt; On 30/04/20 4:21 am, Nancy Yuen wrote:<br>
                &gt; &gt; I've talked with some people a while back
                (long while back) about <br>
                &gt; &gt; multiple BMCs in a system.  Either for
                redundancy or managing separate <br>
                &gt; &gt; parts of a system.   I'm wondering what other
                people are thinking in <br>
                &gt; &gt; this area if at all.<br>
                &gt; &gt; <br>
                &gt; &gt; We are considering similar designs and I'm
                looking into options for <br>
                &gt; &gt; BMC-BMC communications.  Some BMCs may not be
                externally <br>
                &gt; &gt; accessible. Here are some options that we've
                looked at:<br>
                &gt; &gt; <br>
                &gt; &gt;  1. i2c/IPMB<br>
                &gt; &gt;  2. usbnet/Redfish<br>
                &gt; &gt;  3. i2c/MCTP/PLDM or something else?<br>
                &gt; &gt;  4. internal network via switch chip/Redfish
                or MCTP<br>
                &gt; &gt; <br>
                &gt; &gt;   I'd like to reduce our use of IPMI so I want
                to avoid (1).<br>
                &gt; &gt; <br>
                &gt; &gt; ----------<br>
                &gt; &gt; Nancy<br>
                &gt; <br>
                &gt; Hi Nancy,<br>
                &gt; <br>
                &gt; I think it depends on whether the BMCs need to talk
                to each other for <br>
                &gt; platform management, or if they manage their own
                hosts and we need one <br>
                &gt; of the BMCs to broadcast out of band requests and
                aggregate responses.<br>
                &gt; <br>
                &gt; For the former I think PLDM over MCTP could be a
                good fit. This is more <br>
                &gt; of an "inband" use-case in my opinion so I'm not
                sure if Redfish is well <br>
                &gt; suited. For the latter, a Redfish based aggregation
                is a good option.<br>
                <br>
                I think this looks like the right approach. Certainly
                some thought would be<br>
                required in designing the MCTP networks given the
                (intentionally) limited<br>
                number of endpoint IDs.<br>
                <br>
                Andrew<o:p></o:p></p>
            </blockquote>
            <div>
              <p class="MsoNormal"><o:p> </o:p></p>
            </div>
            <div>
              <p class="MsoNormal">Hi Andrew, Deepak,<o:p></o:p></p>
            </div>
            <div>
              <p class="MsoNormal"><o:p> </o:p></p>
            </div>
            <div>
              <p class="MsoNormal">Sorry for the delayed response!<o:p></o:p></p>
            </div>
            <div>
              <p class="MsoNormal"><o:p> </o:p></p>
            </div>
            <div>
              <p class="MsoNormal">For the purposes of this discussion I
                have BMCs managing their own host:
                BMC3&lt;---&gt;BMC2&lt;---&gt;BMC1/controller&lt;--&gt;
                external.  I wrote BMC1 but there maybe some other
                controller there that isn't strictly a BMC.  BMC2 would
                be "passing through" information between BMC1 and BMC3. 
                But I don't necessarily want BMC2 to do any form of
                aggregation from information from BMC3.  For
                BMC1/Controller and BMC 2 we are thinking Redfish.  <o:p></o:p></p>
            </div>
            <div>
              <p class="MsoNormal"><o:p> </o:p></p>
            </div>
            <div>
              <p class="MsoNormal">In my case I'm interested in what
                ways people are thinking BMC2 and BMC3 should be
                connected and speaking to each other. Is MCTP/PLDM where
                everyone is leaning?<o:p></o:p></p>
              <p class="MsoNormal"><o:p> </o:p></p>
              <p class="MsoNormal">Nancy,<o:p></o:p></p>
              <p class="MsoNormal">What is connectivity between BMC1,
                BMC2 and BMC3. Are these exposing any out of band
                connections. For security reasons, aggregator should use
                inband connectivity between BMCs and as Deepak said MCTP
                is good option for inband.<o:p></o:p></p>
            </div>
            <div>
              <p class="MsoNormal"><o:p> </o:p></p>
            </div>
            <div>
              <p class="MsoNormal"><o:p> </o:p></p>
            </div>
            <div>
              <p class="MsoNormal"><o:p> </o:p></p>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------76301776A0299F504B8D3960--
