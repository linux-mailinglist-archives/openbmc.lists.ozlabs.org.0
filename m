Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E58E2B8844
	for <lists+openbmc@lfdr.de>; Thu, 19 Nov 2020 00:19:00 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CbzJx6brBzDqY5
	for <lists+openbmc@lfdr.de>; Thu, 19 Nov 2020 10:18:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=phoenix.com (client-ip=63.128.21.170;
 helo=us-smtp-delivery-170.mimecast.com;
 envelope-from=patrick_voelker@phoenix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=phoenix.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=phoenix.com header.i=@phoenix.com header.a=rsa-sha256
 header.s=mimecast20170203 header.b=M/5LO62Y; 
 dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com
 header.a=rsa-sha256 header.s=mimecast20170203 header.b=M/5LO62Y; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [63.128.21.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CbzHy5LSczDqY2
 for <openbmc@lists.ozlabs.org>; Thu, 19 Nov 2020 10:18:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1605741479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zDvIcEDom2G7Yq5EH/r5NkrQdy9WN/7ADiK5bHoV2rw=;
 b=M/5LO62YJWAHwu4AH5fUBpgUcEnHWfe88THAgOCWmQcKATDPtMzJTGBqr4T84fLiy0ZGaF
 w/LD8sJgHUiXiJiZCUkEjhUcm+zvf3OzPMlqd/B99kSE8AEK/rRFeM+zwsYcuJhpmfzXSn
 6S614ZBM6xECNcHT3iDsdlRAvKxgRuk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1605741479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zDvIcEDom2G7Yq5EH/r5NkrQdy9WN/7ADiK5bHoV2rw=;
 b=M/5LO62YJWAHwu4AH5fUBpgUcEnHWfe88THAgOCWmQcKATDPtMzJTGBqr4T84fLiy0ZGaF
 w/LD8sJgHUiXiJiZCUkEjhUcm+zvf3OzPMlqd/B99kSE8AEK/rRFeM+zwsYcuJhpmfzXSn
 6S614ZBM6xECNcHT3iDsdlRAvKxgRuk=
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-CjMZ0nboPje8Pm5MiKBgqg-1; Wed, 18 Nov 2020 18:17:56 -0500
X-MC-Unique: CjMZ0nboPje8Pm5MiKBgqg-1
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Wed, 18 Nov 2020 15:17:53 -0800
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Wed, 18 Nov 2020 15:17:53 -0800
From: Patrick Voelker <Patrick_Voelker@phoenix.com>
To: "OpenBMC (openbmc@lists.ozlabs.org)" <openbmc@lists.ozlabs.org>
Subject: Failure building burn_my_bmc
Thread-Topic: Failure building burn_my_bmc
Thread-Index: Ada+AOAhQLbL+DGrQcWxAPKwAZTxBw==
Date: Wed, 18 Nov 2020 23:17:51 +0000
Message-ID: <5af426cdbf754c2d898d37d7f591464d@SCL-EXCHMB-13.phoenix.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.122.68.149]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: SCL-EXCHMB-13.phoenix.com
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA70A150 smtp.mailfrom=patrick_voelker@phoenix.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: phoenix.com
Content-Language: en-US
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
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
Cc: Patrick Venture <venture@google.com>,
 "brandonkim@google.com" <brandonkim@google.com>,
 "anoo@us.ibm.com" <anoo@us.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

I'm having an issue building burn_my_bmc with the instructions listed on ht=
tps://github.com/openbmc/phosphor-ipmi-flash . Got through building all the=
 dependencies but I get the following errors when building pci.cpp.  Looks =
like maybe stdplus changed?

pvoelker@bmc-dev:~/bmc/host-tool/phosphor-ipmi-flash$ make
make  all-recursive
make[1]: Entering directory '/home/pvoelker/bmc/host-tool/phosphor-ipmi-fla=
sh'
Making all in .
make[2]: Entering directory '/home/pvoelker/bmc/host-tool/phosphor-ipmi-fla=
sh'
  CXX      internal/libfirmware_common_la-sys.lo
  CXXLD    libfirmware_common.la
ar: `u' modifier ignored since `D' is the default (see `U')
make[2]: Leaving directory '/home/pvoelker/bmc/host-tool/phosphor-ipmi-flas=
h'
Making all in tools
make[2]: Entering directory '/home/pvoelker/bmc/host-tool/phosphor-ipmi-fla=
sh/tools'
Making all in .
make[3]: Entering directory '/home/pvoelker/bmc/host-tool/phosphor-ipmi-fla=
sh/tools'
  CXX      libupdater_la-updater.lo
  CXX      libupdater_la-handler.lo
  CXX      libupdater_la-helper.lo
  CXX      libupdater_la-bt.lo
  CXX      libupdater_la-lpc.lo
  CXX      libupdater_la-io.lo
  CXX      libupdater_la-net.lo
  CXX      libupdater_la-pci.lo
In file included from pci.cpp:17:0:
pci.hpp:40:39: error: 'span' in namespace 'stdplus' does not name a templat=
e type
     virtual void write(const stdplus::span<const std::uint8_t> data) =3D 0=
;
                                       ^~~~
pci.hpp:40:43: error: expected ',' or '...' before '<' token
     virtual void write(const stdplus::span<const std::uint8_t> data) =3D 0=
;
                                           ^
pci.hpp:51:39: error: 'span' in namespace 'stdplus' does not name a templat=
e type
     virtual void write(const stdplus::span<const std::uint8_t> data) overr=
ide;
                                       ^~~~
pci.hpp:51:43: error: expected ',' or '...' before '<' token
     virtual void write(const stdplus::span<const std::uint8_t> data) overr=
ide;
                                           ^
pci.cpp:105:44: error: 'span' in namespace 'stdplus' does not name a templa=
te type
 void PciAccessBridge::write(const stdplus::span<const std::uint8_t> data)
                                            ^~~~
pci.cpp:105:48: error: expected ',' or '...' before '<' token
 void PciAccessBridge::write(const stdplus::span<const std::uint8_t> data)
                                                ^
pci.cpp: In member function 'virtual void host_tool::PciAccessBridge::write=
(int)':
pci.cpp:107:9: error: 'data' was not declared in this scope
     if (data.size() > dataLength)
         ^~~~
pci.cpp:107:9: note: suggested alternatives:
In file included from /usr/include/c++/7/string:51:0,
                 from /usr/include/c++/7/stdexcept:39,
                 from /usr/include/c++/7/system_error:41,
                 from ../internal/sys.hpp:19,
                 from pci.hpp:20,
                 from pci.cpp:17:
/usr/include/c++/7/bits/range_access.h:318:5: note:   'std::data'
     data(initializer_list<_Tp> __il) noexcept
     ^~~~
In file included from pci.cpp:26:0:
/usr/local/include/fmt/format.h:952:8: note:   'fmt::v7::detail::data'
 struct data : basic_data<> {};
        ^~~~
pci.cpp:114:36: error: 'data' was not declared in this scope
     std::memcpy(addr + dataOffset, data.data(), data.size());
                                    ^~~~
pci.cpp:114:36: note: suggested alternatives:
In file included from /usr/include/c++/7/string:51:0,
                 from /usr/include/c++/7/stdexcept:39,
                 from /usr/include/c++/7/system_error:41,
                 from ../internal/sys.hpp:19,
                 from pci.hpp:20,
                 from pci.cpp:17:
/usr/include/c++/7/bits/range_access.h:318:5: note:   'std::data'
     data(initializer_list<_Tp> __il) noexcept
     ^~~~
In file included from pci.cpp:26:0:
/usr/local/include/fmt/format.h:952:8: note:   'fmt::v7::detail::data'
 struct data : basic_data<> {};
        ^~~~
Makefile:654: recipe for target 'libupdater_la-pci.lo' failed
make[3]: *** [libupdater_la-pci.lo] Error 1
make[3]: Leaving directory '/home/pvoelker/bmc/host-tool/phosphor-ipmi-flas=
h/tools'
Makefile:708: recipe for target 'all-recursive' failed
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory '/home/pvoelker/bmc/host-tool/phosphor-ipmi-flas=
h/tools'
Makefile:608: recipe for target 'all-recursive' failed
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory '/home/pvoelker/bmc/host-tool/phosphor-ipmi-flas=
h'
Makefile:474: recipe for target 'all' failed
make: *** [all] Error 2

