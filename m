Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 68742258794
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 07:41:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgbXr20nCzDqSQ
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 15:41:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=yugang.chen@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgbWw6vl5zDqQM
 for <openbmc@lists.ozlabs.org>; Tue,  1 Sep 2020 15:40:40 +1000 (AEST)
IronPort-SDR: JTRmudQogmInwg9fK5eBU0xHaYCTuDd6D5oIAkfskPYOnTDWUCvN296QeZV0oJpI07MYTPnmjE
 0c5lnouRiCFQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9730"; a="221337868"
X-IronPort-AV: E=Sophos;i="5.76,378,1592895600"; 
 d="scan'208,217";a="221337868"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2020 22:40:36 -0700
IronPort-SDR: oTvVd5Nz0WwflH7QNGCUaY8xGR7hTBvMOPdaQSddwLqRPDfCv+Nz6YcMR94liHfjzGqjY+i88P
 L812z24BoRPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,378,1592895600"; 
 d="scan'208,217";a="330953145"
Received: from yugangch-mobl.ccr.corp.intel.com (HELO [10.238.4.27])
 ([10.238.4.27])
 by orsmga008.jf.intel.com with ESMTP; 31 Aug 2020 22:40:35 -0700
Subject: ipmibridge CI build failure
To: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <mailman.267.1598923326.20471.openbmc@lists.ozlabs.org>
From: "yugang.chen" <yugang.chen@linux.intel.com>
Message-ID: <b9b17673-9028-cc63-6a66-87ae6fbdba9b@linux.intel.com>
Date: Tue, 1 Sep 2020 13:38:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <mailman.267.1598923326.20471.openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative;
 boundary="------------E34919082DE3D21BB4A3AF40"
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------E34919082DE3D21BB4A3AF40
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Bishop,

ipmibridge CI build is failure  recently,  for example,  the following 
error information for code review #36128,  could you please check if 
it's needed to update CI build? thanks.

here are some code review  with CI build failure recently:

https://gerrit.openbmc-project.xyz/c/openbmc/ipmbbridge/+/36128

https://gerrit.openbmc-project.xyz/c/openbmc/ipmbbridge/+/34579

https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-host-ipmid/+/35781

https://gerrit.openbmc-project.xyz/c/openbmc/ipmbbridge/+/35782



-- Build files have been written to: /home/jenkins-op/workspace/ci-repository/openbmc/ipmbbridge
/home/jenkins-op/workspace/ci-repository/openbmc/ipmbbridge > cmake --build . -- -j 80
*Scanning dependencies of target ipmbbridged*
[ 33%]Building CXX object CMakeFiles/ipmbbridged.dir/ipmbutils.cpp.o
[ 66%]Building CXX object CMakeFiles/ipmbbridged.dir/ipmbbridged.cpp.o
In file included from*/home/jenkins-op/workspace/ci-repository/openbmc/ipmbbridge/ipmbutils.cpp:16*:
*/home/jenkins-op/workspace/ci-repository/openbmc/ipmbbridge/ipmbbridged.hpp:201:32:*  *error: *���*steady_timer*��� is not a member of ���*boost::asio*���
   201 |     std::optional<boost::asio::*steady_timer*> timer;
       |*^~~~~~~~~~~~*
*/home/jenkins-op/workspace/ci-repository/openbmc/ipmbbridge/ipmbbridged.hpp:201:44:*  *error: *template argument 1 is invalid
   201 |     std::optional<boost::asio::steady_timer*>*  timer;
       |*^*
*/home/jenkins-op/workspace/ci-repository/openbmc/ipmbbridge/ipmbbridged.hpp:262:40:*  *error: *expected ���*)*��� before ���*&*��� token
   262 |     IpmbChannel(boost::asio::io_service**&io, uint8_t ipmbBmcSlaveAddress,
       |~                        *^*~
       |)
In file included from*/home/jenkins-op/workspace/ci-repository/openbmc/ipmbbridge/ipmbbridged.cpp:16*:
*/home/jenkins-op/workspace/ci-repository/openbmc/ipmbbridge/ipmbbridged.hpp:201:32:*  *error: *���*steady_timer*��� is not a member of ���*boost::asio*���
   201 |     std::optional<boost::asio::*steady_timer*> timer;
       |*^~~~~~~~~~~~*
*/home/jenkins-op/workspace/ci-repository/openbmc/ipmbbridge/ipmbbridged.hpp:201:44:*  *error: *template argument 1 is invalid
   201 |     std::optional<boost::asio::steady_timer*>*  timer;
       |*^*
*/home/jenkins-op/workspace/ci-repository/openbmc/ipmbbridge/ipmbbridged.hpp:262:40:*  *error: *expected ���*)*��� before ���*&*��� token
   262 |     IpmbChannel(boost::asio::io_service**&io, uint8_t ipmbBmcSlaveAddress,
       |~                        *^*~
       |)
*/home/jenkins-op/workspace/ci-repository/openbmc/ipmbbridge/ipmbbridged.cpp:36:14:*  *error: *���*io_service*��� in namespace ���*boost::asio*��� does not name a type; did you mean ���*has_service*���?
    36 | boost::asio::*io_service*  io;
       |*^~~~~~~~~~*
       |has_service
*/home/jenkins-op/workspace/ci-repository/openbmc/ipmbbridge/ipmbbridged.cpp:37:59:*  *error: *���*io*��� was not declared in this scope
    37 | auto conn = std::make_shared<sdbusplus::asio::connection>(*io*);
       |*^~*
*/home/jenkins-op/workspace/ci-repository/openbmc/ipmbbridge/ipmbbridged.cpp:*  In constructor ���*IpmbRequest::IpmbRequest(uint8_t, uint8_t, uint8_t, uint8_t, uint8_t, 
uint8_t, uint8_t, const std::vector<unsigned char>&)*���:
*/home/jenkins-op/workspace/ci-repository/openbmc/ipmbbridge/ipmbbridged.cpp:57:11:*  *error: *���*io*��� was not declared in this scope
    57 |     timer(*io*)
       |*^~*
*/home/jenkins-op/workspace/ci-repository/openbmc/ipmbbridge/ipmbbridged.cpp:*  In member function ���*void IpmbChannel::ipmbSendI2cFrame(std::shared_ptr<std::vector<unsigned 
char> >, size_t)*���:
*/home/jenkins-op/workspace/ci-repository/openbmc/ipmbbridge/ipmbbridged.cpp:265:18:*  *error: *���*async_write*��� is not a member of ���*boost::asio*���; did you mean ���*async_initiate*���?
   265 |     boost::asio::*async_write*(
       |*^~~~~~~~~~~*
       |async_initiate
*/home/jenkins-op/workspace/ci-repository/openbmc/ipmbbridge/ipmbbridged.cpp:*  In member function ���*void IpmbChannel::responseMatch(std::unique_ptr<IpmbResponse>&)*���:
*/home/jenkins-op/workspace/ci-repository/openbmc/ipmbbridge/ipmbbridged.cpp:344:27:*  *error: *base operand of ���*->*��� is not a pointer
   344 |             request->timer*->*cancel();
       |*^~*
*/home/jenkins-op/workspace/ci-repository/openbmc/ipmbbridge/ipmbbridged.cpp:*  At global scope:
*/home/jenkins-op/workspace/ci-repository/openbmc/ipmbbridge/ipmbbridged.cpp:518:25:*  *error: *expected constructor, destructor, or type conversion before ���*(*��� token
   518 | IpmbChannel::IpmbChannel*(*boost::asio::io_service &io,
       |*^*
*/home/jenkins-op/workspace/ci-repository/openbmc/ipmbbridge/ipmbbridged.cpp:*  In member function ���*std::tuple<int, unsigned char, unsigned char, unsigned char, unsigned 
char, std::vector<unsigned char, std::allocator<unsigned char> > > 
IpmbChannel::requestAdd(boost::asio::yield_context&, 
std::shared_ptr<IpmbRequest>)*���:
*/home/jenkins-op/workspace/ci-repository/openbmc/ipmbbridge/ipmbbridged.cpp:718:26:*  *error: *���*async_write*��� is not a member of ���*boost::asio*���; did you mean ���*async_initiate*���?
   718 |             boost::asio::*async_write*(i2cSlaveDescriptor,
       |*^~~~~~~~~~~*
       |async_initiate
*/home/jenkins-op/workspace/ci-repository/openbmc/ipmbbridge/ipmbbridged.cpp:738:23:*  *error: *base operand of ���*->*��� is not a pointer
   738 |         request->timer*->*expires_after(
       |*^~*
*/home/jenkins-op/workspace/ci-repository/openbmc/ipmbbridge/ipmbbridged.cpp:740:23:*  *error: *base operand of ���*->*��� is not a pointer
   740 |         request->timer*->*async_wait(yield[ec]);
       |*^~*
*/home/jenkins-op/workspace/ci-repository/openbmc/ipmbbridge/ipmbbridged.cpp:*  In function ���*int initializeChannels()*���:
*/home/jenkins-op/workspace/ci-repository/openbmc/ipmbbridge/ipmbbridged.cpp:803:69:*  *error: *���*io*��� was not declared in this scope
   803 |             auto channel = ipmbChannels.emplace(ipmbChannels.end(),*io*, bmcAddr,
       |*^~*
*/home/jenkins-op/workspace/ci-repository/openbmc/ipmbbridge/ipmbbridged.cpp:*  In function ���*int main(int, char**)*���:
*/home/jenkins-op/workspace/ci-repository/openbmc/ipmbbridge/ipmbbridged.cpp:986:5:*  *error: *���*io*��� was not declared in this scope
   986 |*io*.run();
       |*^~*
make[2]: *** [CMakeFiles/ipmbbridged.dir/build.make:76: CMakeFiles/ipmbbridged.dir/ipmbutils.cpp.o] Error 1
make[2]: *** Waiting for unfinished jobs....
make[2]: *** [CMakeFiles/ipmbbridged.dir/build.make:63: CMakeFiles/ipmbbridged.dir/ipmbbridged.cpp.o] Error 1
make[1]: *** [CMakeFiles/Makefile2:76: CMakeFiles/ipmbbridged.dir/all] Error 2
make: *** [Makefile:130: all] Error 2
Traceback (most recent call last):


--------------E34919082DE3D21BB4A3AF40
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Bishop,</p>
    <p>ipmibridge CI build is failure  recently,  for example,  the
      following error information for code review #36128,  could you
      please check if it's needed to update CI build? thanks.</p>
    <p>here are some code review  with CI build failure recently:</p>
    <p><a
        href="https://gerrit.openbmc-project.xyz/c/openbmc/ipmbbridge/+/36128">https://gerrit.openbmc-project.xyz/c/openbmc/ipmbbridge/+/36128</a></p>
    <p><a
        href="https://gerrit.openbmc-project.xyz/c/openbmc/ipmbbridge/+/34579">https://gerrit.openbmc-project.xyz/c/openbmc/ipmbbridge/+/34579</a></p>
    <p><a
href="https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-host-ipmid/+/35781">https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-host-ipmid/+/35781</a></p>
    <p><a
        href="https://gerrit.openbmc-project.xyz/c/openbmc/ipmbbridge/+/35782">https://gerrit.openbmc-project.xyz/c/openbmc/ipmbbridge/+/35782</a></p>
    <p><br>
    </p>
    <br>
    <pre class="console-output" style="box-sizing: inherit; font-size: 0.95em; white-space: pre-wrap; overflow-wrap: break-word; margin: 0px; color: rgb(51, 51, 51); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;">-- Build files have been written to: /home/jenkins-op/workspace/ci-repository/openbmc/ipmbbridge
/home/jenkins-op/workspace/ci-repository/openbmc/ipmbbridge &gt; cmake --build . -- -j 80 
<span style="box-sizing: inherit; color: rgb(205, 0, 205);"><b style="box-sizing: inherit;">Scanning dependencies of target ipmbbridged</b></span>
[ 33%] <span style="box-sizing: inherit; color: rgb(0, 205, 0);">Building CXX object CMakeFiles/ipmbbridged.dir/ipmbutils.cpp.o</span>
[ 66%] <span style="box-sizing: inherit; color: rgb(0, 205, 0);">Building CXX object CMakeFiles/ipmbbridged.dir/ipmbbridged.cpp.o</span>
In file included from <b style="box-sizing: inherit;">/home/jenkins-op/workspace/ci-repository/openbmc/ipmbbridge/ipmbutils.cpp:16</b>:
<b style="box-sizing: inherit;">/home/jenkins-op/workspace/ci-repository/openbmc/ipmbbridge/ipmbbridged.hpp:201:32:</b> <b style="box-sizing: inherit;"><span style="box-sizing: inherit; color: rgb(205, 0, 0);">error: </span></b>���<b style="box-sizing: inherit;">steady_timer</b>��� is not a member of ���<b style="box-sizing: inherit;">boost::asio</b>���
  201 |     std::optional&lt;boost::asio::<b style="box-sizing: inherit;"><span style="box-sizing: inherit; color: rgb(205, 0, 0);">steady_timer</span></b>&gt; timer;
      |                                <b style="box-sizing: inherit;"><span style="box-sizing: inherit; color: rgb(205, 0, 0);">^~~~~~~~~~~~</span></b>
<b style="box-sizing: inherit;">/home/jenkins-op/workspace/ci-repository/openbmc/ipmbbridge/ipmbbridged.hpp:201:44:</b> <b style="box-sizing: inherit;"><span style="box-sizing: inherit; color: rgb(205, 0, 0);">error: </span></b>template argument 1 is invalid
  201 |     std::optional&lt;boost::asio::steady_timer<b style="box-sizing: inherit;"><span style="box-sizing: inherit; color: rgb(205, 0, 0);">&gt;</span></b> timer;
      |                                            <b style="box-sizing: inherit;"><span style="box-sizing: inherit; color: rgb(205, 0, 0);">^</span></b>
<b style="box-sizing: inherit;">/home/jenkins-op/workspace/ci-repository/openbmc/ipmbbridge/ipmbbridged.hpp:262:40:</b> <b style="box-sizing: inherit;"><span style="box-sizing: inherit; color: rgb(205, 0, 0);">error: </span></b>expected ���<b style="box-sizing: inherit;">)</b>��� before ���<b style="box-sizing: inherit;">&amp;</b>��� token
  262 |     IpmbChannel<span style="box-sizing: inherit; color: rgb(30, 144, 255);">(</span>boost::asio::io_service<b style="box-sizing: inherit;"><span style="box-sizing: inherit; color: rgb(205, 0, 0);"> </span></b><span style="box-sizing: inherit; color: rgb(0, 205, 0);">&amp;</span>io, uint8_t ipmbBmcSlaveAddress,
      |                <span style="box-sizing: inherit; color: rgb(30, 144, 255);">~</span>                       <b style="box-sizing: inherit;"><span style="box-sizing: inherit; color: rgb(205, 0, 0);">^</span></b><span style="box-sizing: inherit; color: rgb(0, 205, 0);">~</span>
      |                                        <span style="box-sizing: inherit; color: rgb(0, 205, 0);">)</span>
In file included from <b style="box-sizing: inherit;">/home/jenkins-op/workspace/ci-repository/openbmc/ipmbbridge/ipmbbridged.cpp:16</b>:
<b style="box-sizing: inherit;">/home/jenkins-op/workspace/ci-repository/openbmc/ipmbbridge/ipmbbridged.hpp:201:32:</b> <b style="box-sizing: inherit;"><span style="box-sizing: inherit; color: rgb(205, 0, 0);">error: </span></b>���<b style="box-sizing: inherit;">steady_timer</b>��� is not a member of ���<b style="box-sizing: inherit;">boost::asio</b>���
  201 |     std::optional&lt;boost::asio::<b style="box-sizing: inherit;"><span style="box-sizing: inherit; color: rgb(205, 0, 0);">steady_timer</span></b>&gt; timer;
      |                                <b style="box-sizing: inherit;"><span style="box-sizing: inherit; color: rgb(205, 0, 0);">^~~~~~~~~~~~</span></b>
<b style="box-sizing: inherit;">/home/jenkins-op/workspace/ci-repository/openbmc/ipmbbridge/ipmbbridged.hpp:201:44:</b> <b style="box-sizing: inherit;"><span style="box-sizing: inherit; color: rgb(205, 0, 0);">error: </span></b>template argument 1 is invalid
  201 |     std::optional&lt;boost::asio::steady_timer<b style="box-sizing: inherit;"><span style="box-sizing: inherit; color: rgb(205, 0, 0);">&gt;</span></b> timer;
      |                                            <b style="box-sizing: inherit;"><span style="box-sizing: inherit; color: rgb(205, 0, 0);">^</span></b>
<b style="box-sizing: inherit;">/home/jenkins-op/workspace/ci-repository/openbmc/ipmbbridge/ipmbbridged.hpp:262:40:</b> <b style="box-sizing: inherit;"><span style="box-sizing: inherit; color: rgb(205, 0, 0);">error: </span></b>expected ���<b style="box-sizing: inherit;">)</b>��� before ���<b style="box-sizing: inherit;">&amp;</b>��� token
  262 |     IpmbChannel<span style="box-sizing: inherit; color: rgb(30, 144, 255);">(</span>boost::asio::io_service<b style="box-sizing: inherit;"><span style="box-sizing: inherit; color: rgb(205, 0, 0);"> </span></b><span style="box-sizing: inherit; color: rgb(0, 205, 0);">&amp;</span>io, uint8_t ipmbBmcSlaveAddress,
      |                <span style="box-sizing: inherit; color: rgb(30, 144, 255);">~</span>                       <b style="box-sizing: inherit;"><span style="box-sizing: inherit; color: rgb(205, 0, 0);">^</span></b><span style="box-sizing: inherit; color: rgb(0, 205, 0);">~</span>
      |                                        <span style="box-sizing: inherit; color: rgb(0, 205, 0);">)</span>
<b style="box-sizing: inherit;">/home/jenkins-op/workspace/ci-repository/openbmc/ipmbbridge/ipmbbridged.cpp:36:14:</b> <b style="box-sizing: inherit;"><span style="box-sizing: inherit; color: rgb(205, 0, 0);">error: </span></b>���<b style="box-sizing: inherit;">io_service</b>��� in namespace ���<b style="box-sizing: inherit;">boost::asio</b>��� does not name a type; did you mean ���<b style="box-sizing: inherit;">has_service</b>���?
   36 | boost::asio::<b style="box-sizing: inherit;"><span style="box-sizing: inherit; color: rgb(205, 0, 0);">io_service</span></b> io;
      |              <b style="box-sizing: inherit;"><span style="box-sizing: inherit; color: rgb(205, 0, 0);">^~~~~~~~~~</span></b>
      |              <span style="box-sizing: inherit; color: rgb(0, 205, 0);">has_service</span>
<b style="box-sizing: inherit;">/home/jenkins-op/workspace/ci-repository/openbmc/ipmbbridge/ipmbbridged.cpp:37:59:</b> <b style="box-sizing: inherit;"><span style="box-sizing: inherit; color: rgb(205, 0, 0);">error: </span></b>���<b style="box-sizing: inherit;">io</b>��� was not declared in this scope
   37 | auto conn = std::make_shared&lt;sdbusplus::asio::connection&gt;(<b style="box-sizing: inherit;"><span style="box-sizing: inherit; color: rgb(205, 0, 0);">io</span></b>);
      |                                                           <b style="box-sizing: inherit;"><span style="box-sizing: inherit; color: rgb(205, 0, 0);">^~</span></b>
<b style="box-sizing: inherit;">/home/jenkins-op/workspace/ci-repository/openbmc/ipmbbridge/ipmbbridged.cpp:</b> In constructor ���<b style="box-sizing: inherit;">IpmbRequest::IpmbRequest(uint8_t, uint8_t, uint8_t, uint8_t, uint8_t, uint8_t, uint8_t, const std::vector&lt;unsigned char&gt;&amp;)</b>���:
<b style="box-sizing: inherit;">/home/jenkins-op/workspace/ci-repository/openbmc/ipmbbridge/ipmbbridged.cpp:57:11:</b> <b style="box-sizing: inherit;"><span style="box-sizing: inherit; color: rgb(205, 0, 0);">error: </span></b>���<b style="box-sizing: inherit;">io</b>��� was not declared in this scope
   57 |     timer(<b style="box-sizing: inherit;"><span style="box-sizing: inherit; color: rgb(205, 0, 0);">io</span></b>)
      |           <b style="box-sizing: inherit;"><span style="box-sizing: inherit; color: rgb(205, 0, 0);">^~</span></b>
<b style="box-sizing: inherit;">/home/jenkins-op/workspace/ci-repository/openbmc/ipmbbridge/ipmbbridged.cpp:</b> In member function ���<b style="box-sizing: inherit;">void IpmbChannel::ipmbSendI2cFrame(std::shared_ptr&lt;std::vector&lt;unsigned char&gt; &gt;, size_t)</b>���:
<b style="box-sizing: inherit;">/home/jenkins-op/workspace/ci-repository/openbmc/ipmbbridge/ipmbbridged.cpp:265:18:</b> <b style="box-sizing: inherit;"><span style="box-sizing: inherit; color: rgb(205, 0, 0);">error: </span></b>���<b style="box-sizing: inherit;">async_write</b>��� is not a member of ���<b style="box-sizing: inherit;">boost::asio</b>���; did you mean ���<b style="box-sizing: inherit;">async_initiate</b>���?
  265 |     boost::asio::<b style="box-sizing: inherit;"><span style="box-sizing: inherit; color: rgb(205, 0, 0);">async_write</span></b>(
      |                  <b style="box-sizing: inherit;"><span style="box-sizing: inherit; color: rgb(205, 0, 0);">^~~~~~~~~~~</span></b>
      |                  <span style="box-sizing: inherit; color: rgb(0, 205, 0);">async_initiate</span>
<b style="box-sizing: inherit;">/home/jenkins-op/workspace/ci-repository/openbmc/ipmbbridge/ipmbbridged.cpp:</b> In member function ���<b style="box-sizing: inherit;">void IpmbChannel::responseMatch(std::unique_ptr&lt;IpmbResponse&gt;&amp;)</b>���:
<b style="box-sizing: inherit;">/home/jenkins-op/workspace/ci-repository/openbmc/ipmbbridge/ipmbbridged.cpp:344:27:</b> <b style="box-sizing: inherit;"><span style="box-sizing: inherit; color: rgb(205, 0, 0);">error: </span></b>base operand of ���<b style="box-sizing: inherit;">-&gt;</b>��� is not a pointer
  344 |             request-&gt;timer<b style="box-sizing: inherit;"><span style="box-sizing: inherit; color: rgb(205, 0, 0);">-&gt;</span></b>cancel();
      |                           <b style="box-sizing: inherit;"><span style="box-sizing: inherit; color: rgb(205, 0, 0);">^~</span></b>
<b style="box-sizing: inherit;">/home/jenkins-op/workspace/ci-repository/openbmc/ipmbbridge/ipmbbridged.cpp:</b> At global scope:
<b style="box-sizing: inherit;">/home/jenkins-op/workspace/ci-repository/openbmc/ipmbbridge/ipmbbridged.cpp:518:25:</b> <b style="box-sizing: inherit;"><span style="box-sizing: inherit; color: rgb(205, 0, 0);">error: </span></b>expected constructor, destructor, or type conversion before ���<b style="box-sizing: inherit;">(</b>��� token
  518 | IpmbChannel::IpmbChannel<b style="box-sizing: inherit;"><span style="box-sizing: inherit; color: rgb(205, 0, 0);">(</span></b>boost::asio::io_service &amp;io,
      |                         <b style="box-sizing: inherit;"><span style="box-sizing: inherit; color: rgb(205, 0, 0);">^</span></b>
<b style="box-sizing: inherit;">/home/jenkins-op/workspace/ci-repository/openbmc/ipmbbridge/ipmbbridged.cpp:</b> In member function ���<b style="box-sizing: inherit;">std::tuple&lt;int, unsigned char, unsigned char, unsigned char, unsigned char, std::vector&lt;unsigned char, std::allocator&lt;unsigned char&gt; &gt; &gt; IpmbChannel::requestAdd(boost::asio::yield_context&amp;, std::shared_ptr&lt;IpmbRequest&gt;)</b>���:
<b style="box-sizing: inherit;">/home/jenkins-op/workspace/ci-repository/openbmc/ipmbbridge/ipmbbridged.cpp:718:26:</b> <b style="box-sizing: inherit;"><span style="box-sizing: inherit; color: rgb(205, 0, 0);">error: </span></b>���<b style="box-sizing: inherit;">async_write</b>��� is not a member of ���<b style="box-sizing: inherit;">boost::asio</b>���; did you mean ���<b style="box-sizing: inherit;">async_initiate</b>���?
  718 |             boost::asio::<b style="box-sizing: inherit;"><span style="box-sizing: inherit; color: rgb(205, 0, 0);">async_write</span></b>(i2cSlaveDescriptor,
      |                          <b style="box-sizing: inherit;"><span style="box-sizing: inherit; color: rgb(205, 0, 0);">^~~~~~~~~~~</span></b>
      |                          <span style="box-sizing: inherit; color: rgb(0, 205, 0);">async_initiate</span>
<b style="box-sizing: inherit;">/home/jenkins-op/workspace/ci-repository/openbmc/ipmbbridge/ipmbbridged.cpp:738:23:</b> <b style="box-sizing: inherit;"><span style="box-sizing: inherit; color: rgb(205, 0, 0);">error: </span></b>base operand of ���<b style="box-sizing: inherit;">-&gt;</b>��� is not a pointer
  738 |         request-&gt;timer<b style="box-sizing: inherit;"><span style="box-sizing: inherit; color: rgb(205, 0, 0);">-&gt;</span></b>expires_after(
      |                       <b style="box-sizing: inherit;"><span style="box-sizing: inherit; color: rgb(205, 0, 0);">^~</span></b>
<b style="box-sizing: inherit;">/home/jenkins-op/workspace/ci-repository/openbmc/ipmbbridge/ipmbbridged.cpp:740:23:</b> <b style="box-sizing: inherit;"><span style="box-sizing: inherit; color: rgb(205, 0, 0);">error: </span></b>base operand of ���<b style="box-sizing: inherit;">-&gt;</b>��� is not a pointer
  740 |         request-&gt;timer<b style="box-sizing: inherit;"><span style="box-sizing: inherit; color: rgb(205, 0, 0);">-&gt;</span></b>async_wait(yield[ec]);
      |                       <b style="box-sizing: inherit;"><span style="box-sizing: inherit; color: rgb(205, 0, 0);">^~</span></b>
<b style="box-sizing: inherit;">/home/jenkins-op/workspace/ci-repository/openbmc/ipmbbridge/ipmbbridged.cpp:</b> In function ���<b style="box-sizing: inherit;">int initializeChannels()</b>���:
<b style="box-sizing: inherit;">/home/jenkins-op/workspace/ci-repository/openbmc/ipmbbridge/ipmbbridged.cpp:803:69:</b> <b style="box-sizing: inherit;"><span style="box-sizing: inherit; color: rgb(205, 0, 0);">error: </span></b>���<b style="box-sizing: inherit;">io</b>��� was not declared in this scope
  803 |             auto channel = ipmbChannels.emplace(ipmbChannels.end(), <b style="box-sizing: inherit;"><span style="box-sizing: inherit; color: rgb(205, 0, 0);">io</span></b>, bmcAddr,
      |                                                                     <b style="box-sizing: inherit;"><span style="box-sizing: inherit; color: rgb(205, 0, 0);">^~</span></b>
<b style="box-sizing: inherit;">/home/jenkins-op/workspace/ci-repository/openbmc/ipmbbridge/ipmbbridged.cpp:</b> In function ���<b style="box-sizing: inherit;">int main(int, char**)</b>���:
<b style="box-sizing: inherit;">/home/jenkins-op/workspace/ci-repository/openbmc/ipmbbridge/ipmbbridged.cpp:986:5:</b> <b style="box-sizing: inherit;"><span style="box-sizing: inherit; color: rgb(205, 0, 0);">error: </span></b>���<b style="box-sizing: inherit;">io</b>��� was not declared in this scope
  986 |     <b style="box-sizing: inherit;"><span style="box-sizing: inherit; color: rgb(205, 0, 0);">io</span></b>.run();
      |     <b style="box-sizing: inherit;"><span style="box-sizing: inherit; color: rgb(205, 0, 0);">^~</span></b>
make[2]: *** [CMakeFiles/ipmbbridged.dir/build.make:76: CMakeFiles/ipmbbridged.dir/ipmbutils.cpp.o] Error 1
make[2]: *** Waiting for unfinished jobs....
make[2]: *** [CMakeFiles/ipmbbridged.dir/build.make:63: CMakeFiles/ipmbbridged.dir/ipmbbridged.cpp.o] Error 1
make[1]: *** [CMakeFiles/Makefile2:76: CMakeFiles/ipmbbridged.dir/all] Error 2
make: *** [Makefile:130: all] Error 2
Traceback (most recent call last):</pre>
    <blockquote type="cite"
      cite="mid:mailman.267.1598923326.20471.openbmc@lists.ozlabs.org">
    </blockquote>
  </body>
</html>

--------------E34919082DE3D21BB4A3AF40--
