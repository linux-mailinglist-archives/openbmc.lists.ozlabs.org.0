Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33646253D01
	for <lists+openbmc@lfdr.de>; Thu, 27 Aug 2020 06:56:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BcVn60yHvzDqYt
	for <lists+openbmc@lfdr.de>; Thu, 27 Aug 2020 14:56:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=cPrdkRrS; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BcVkN226GzDqGn
 for <openbmc@lists.ozlabs.org>; Thu, 27 Aug 2020 14:54:03 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id CED4A574F3
 for <openbmc@lists.ozlabs.org>; Thu, 27 Aug 2020 04:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1598504036; x=1600318437; bh=n5VDvX58ZsUmsVwvGNl0a6AO+
 tz0IAqKSLCDKUN9PSE=; b=cPrdkRrSxogfRqtJG6RUBTmE4LFRQ+RB99NeoiICe
 ObJKxPX7EmPDfgDJAFLrXl5d7Sm5OewkCBEHM5Yjiqhcia3tUzas76Fj+tqmNhWO
 WukVIaPJ0I/1+8nd4E5K9JiqV1WPhBGsGBC6lC8ItswK2U5KXJqapmgj25ysg9SG
 Ro=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lJgHihkKsc3x for <openbmc@lists.ozlabs.org>;
 Thu, 27 Aug 2020 07:53:56 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 8BFE256CCB
 for <openbmc@lists.ozlabs.org>; Thu, 27 Aug 2020 07:53:56 +0300 (MSK)
Received: from [10.199.0.82] (10.199.0.82) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 27
 Aug 2020 07:53:56 +0300
Message-ID: <192545d0b2abdd9405cbc7736400b75fa0d692d5.camel@yadro.com>
Subject: Re: OpenBMC - FRU inventory with Entity Manager
From: Andrei Kartashev <a.kartashev@yadro.com>
To: <openbmc@lists.ozlabs.org>
Date: Thu, 27 Aug 2020 07:53:55 +0300
In-Reply-To: <DM6PR12MB3020D6DD47C7E6DBBD6530A3CD550@DM6PR12MB3020.namprd12.prod.outlook.com>
References: <DM6PR12MB3020D6DD47C7E6DBBD6530A3CD550@DM6PR12MB3020.namprd12.prod.outlook.com>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.199.0.82]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
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

Hi,

That is actually depend on which platform you are. E.g. we are derived
from intel-platforms and there are "intel-ipmi-oem" package which
handles ipmi fru commands. This case just everything found by FruDevice
would appear in "ipmitool fru list".
Otherwise I believe you need to add your device found by FruDevice to
inventory which can be done with EntityManager probe rule. Note that
FruDevice and EntityManager are different application and they are not
connected by default. Please check "xyz.openbmc_project.FruDevice"

~# busctl tree --no-pager xyz.openbmc_project.FruDevice
`-/xyz
  `-/xyz/openbmc_project
    `-/xyz/openbmc_project/FruDevice
      |-/xyz/openbmc_project/FruDevice/DPS_2000AB_2_E
      `-/xyz/openbmc_project/FruDevice/Motherboard
~# busctl tree --no-pager xyz.openbmc_project.EntityManager
`-/xyz
  `-/xyz/openbmc_project
    |-/xyz/openbmc_project/EntityManager
    `-/xyz/openbmc_project/inventory
      `-/xyz/openbmc_project/inventory/system
        |-/xyz/openbmc_project/inventory/system/board
        | |-/xyz/openbmc_project/inventory/system/board/PCIE_Device_3
        | |-/xyz/openbmc_project/inventory/system/board/PCIE_Device_4
        | |-/xyz/openbmc_project/inventory/system/board/PCIE_Device_5
        | `-/xyz/openbmc_project/inventory/system/board/Baseboard

[.....]

On Thu, 2020-08-27 at 00:47 +0000, Jiandi An wrote:
> Hi,
> 
> Have a question related how IPMI fru command is handled when having
> FRU inventory handled by Entity Manager.
> I've enabled Entity Manager and through the config JSONs, got the
> entity manager to probe FRU config information off of EEPROM and
> getting the FruDevice inventory D-Bus object added.
> For example I I have /xyz/openbmc_project/FruDevice/My_FRU show up
> under xyz.openbmc_project.FruDevice.  And I can introspect it.  But I
> can't get that FRU to be handled and displayed when I ran "ipmitool
> fru"
> 
> root@bmc:~# busctl tree --no-pager xyz.openbmc_project.FruDevice
> └/xyz
>   └/xyz/openbmc_project
>     └/xyz/openbmc_project/FruDevice
>       └/xyz/openbmc_project/FruDevice/My_FRU
> 
> root@bmc:~# busctl introspect --no-pager
> xyz.openbmc_project.FruDevice /xyz/openbmc_project/FruDevice/My_FRU
> NAME                                                          TYPE   
>                 SIGNATURE   RESULT/VALUE                       FLAGS
> org.freedesktop.DBus.Introspectable   interface             -        
>               -                                                 -
> .Introspect                                                  method  
>              -                      s                                
>                 -
> org.freedesktop.DBus.Peer                     interface             -
>                       -                                              
>    -
> .GetMachineId                                           method       
>         -                      s                                     
>            -
> .Ping                                                             met
> hod               -                      -                           
>                       -
> org.freedesktop.DBus.Properties           interface             -    
>                   -                                                 -
> .Get                                                              met
> hod               ss                    v                            
>                      -
> .GetAll                                                          meth
> od               s                     a{sv}                         
>                  -
> .Set                                                               me
> thod               ssv                  -                            
>                      -
> .PropertiesChanged                                   signal          
>         sa{sv}as          -                                          
>        -
> xyz.openbmc_project.FruDevice            interface              -    
>                   -                                                 -
> .ADDRESS                                                    property 
>              u                     84                                
>              emits-change
> .BOARD_INFO_AM1                                  property            
>   s                     "\001"                                      e
> mits-change
> .BOARD_LANGUAGE_CODE                     property              s     
>                 "25"                                          emits-
> change
> .BOARD_MANUFACTURER                       property              s    
>                  "XYZ COMPANY"                    emits-change
> .BOARD_MANUFACTURE_DATE              property              s         
>             "2020-01-01 - 12:00:00"      emits-change
> .BOARD_PART_NUMBER                          property              s  
>                     "123.ABCD.1234"                 emits-change
> .BOARD_PRODUCT_NAME                       property              s    
>                   "My FRU"                               emits-change
> .BOARD_SERIAL_NUMBER                       property               s  
>                    "123ABC"                                emits-
> change
> .BUS                                                              pro
> perty              u                     2                           
>                      emits-change
> .CHASSIS_PART_NUMBER                        property               s 
>                     "123-12345-1234-000"         emits-change
> .CHASSIS_SERIAL_NUMBER                     property               s  
>                    "1234567890123"                  emits-change
> .CHASSIS_TYPE                                           property     
>           s                     "23"                                 
>           emits-change
> .Common_Format_Version                     property               s  
>                    "1"                                             em
> its-change
> .PRODUCT_ASSET_TAG                            property               
> s                     "0000000000000"                  emits-change
> .PRODUCT_FRU_VERSION_ID                 property               s     
>                 "v0.5"                                        emits-
> change
> .PRODUCT_LANGUAGE_CODE                property               s       
>               "25"                                           emits-
> change
> .PRODUCT_MANUFACTURER                  property               s      
>                "XYZ COMPANY"                      emits-change
> .PRODUCT_PART_NUMBER                     property               s    
>                  "123-12345-1234-000"          emits-change
> .PRODUCT_PRODUCT_NAME                  property               s      
>                "TBD"                                        emits-
> change
> .PRODUCT_SERIAL_NUMBER                  property               s     
>                 "1234567890123"                   emits-change
> .PRODUCT_VERSION                                 property            
>    s                     "v1.0"                                      
>    emits-change 
> 
> When I ran the standard IPMI fru command, it always defaults to
> getting Builtin FRU Device, and dimm0, dimm1, cpu0, cpu1 FRUs and of
> course they are not there so it fails.  Is there anything that I'm
> missing to get the standard IPMI fru command to map to the DBUS
> object xyz.openbmc_project.FruDevice
> /xyz/openbmc_project/FruDevice/My_FRU under Entity Manger?
> 
> root@dev-system:~# ipmitool -I lanplus -H $BMC_IP -U root -P 0penBmc
> -C 17 fru
> FRU Device Description : Builtin FRU Device (ID 0)
>  Device not present (Unspecified error)
> 
> FRU Device Description : dimm0 (ID 1)
>  Device not present (Unspecified error)
> 
> FRU Device Description : dimm1 (ID 2)
>  Device not present (Unspecified error)
> 
> FRU Device Description : cpu0 (ID 3)
>  Device not present (Unspecified error)
> 
> FRU Device Description : cpu1 (ID 4)
>  Device not present (Unspecified error)
> 
> Thanks
> - Jiandi

